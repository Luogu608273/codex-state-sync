param(
    [ValidateSet('Documents', 'Codex', 'All')][string]$Target = 'Documents',
    [ValidateSet('Menu', 'Init', 'Status', 'Pull', 'Push', 'Sync', 'Prepare', 'RestoreMemory', 'FirstConnect', 'RestoreChats')][string]$Action = 'Menu',
    [string]$Root,
    [string]$RemoteUrl,
    [string]$Message,
    [string]$DocumentsRoot,
    [string]$CodexRoot,
    [switch]$NonInteractive,
    [switch]$Log
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
$OutputEncoding = [Console]::OutputEncoding
$utf8 = New-Object System.Text.UTF8Encoding($false)
$codexIgnore = @'
# FileSync: only configuration, instructions and conversations
/*
!/.gitignore
!/.gitattributes
!/*.toml
!/*.md
!/*.yaml
!/*.yml
!/*.ini
!/*config*.json
!/hooks.json
!/history.jsonl
!/session_index.jsonl
!/sessions/
!/archived_sessions/
!/rules/
!/skills/
!/prompts/
!/instructions/
!/agents/
!/profiles/
!/config/
!/hooks/
!/memories/
auth.json
*.sqlite
*.sqlite-shm
*.sqlite-wal
'@

. (Join-Path $PSScriptRoot 'codex-state.ps1')
. (Join-Path $PSScriptRoot 'first-connect.ps1')

function Invoke-Git {
    param([string[]]$GitArgs, [switch]$Capture, [int[]]$Allowed = @(0))
    Write-Host ('> git ' + ($GitArgs -join ' ')) -ForegroundColor DarkGray
    $old = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try { $output = @(& $script:Git -c core.quotePath=false -C $script:Root @GitArgs 2>&1); $code = $LASTEXITCODE }
    finally { $ErrorActionPreference = $old }
    if ($code -notin $Allowed) {
        $output | ForEach-Object { Write-Host $_ }
        throw "Git 返回 $code，请按上面的输出排查。"
    }
    if ($Capture) { return $output | ForEach-Object { [string]$_ } }
    $output | ForEach-Object { Write-Host $_ }
}

function Require-Repo {
    if (-not (Test-Path -LiteralPath (Join-Path $script:Root '.git'))) { throw '先选择“初始化”，或在第二台电脑克隆仓库到目标目录。' }
    $top = [string](Invoke-Git @('rev-parse', '--show-toplevel') -Capture)
    if ([IO.Path]::GetFullPath($top).TrimEnd('\', '/') -ine $script:Root.TrimEnd('\', '/')) { throw '目标目录不是仓库根目录，请检查 -Root。' }
}

function Save-EmptyDirs {
    $queue = New-Object 'System.Collections.Generic.Queue[string]'
    $empty = New-Object 'System.Collections.Generic.List[string]'
    $queue.Enqueue($script:Root)
    while ($queue.Count) {
        $dir = $queue.Dequeue()
        $items = @(Get-ChildItem -LiteralPath $dir -Force)
        if ($dir -ne $script:Root -and $items.Count -eq 0) { $empty.Add($dir.Substring($script:Root.Length + 1).Replace('\', '/')) }
        foreach ($item in $items) {
            if ($item.Name -eq '.git') {
                if ($dir -ne $script:Root) { throw "有嵌套 Git 仓库：$dir。请先处理，再同步整个目录。" }
                continue
            }
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "目录内有链接：$($item.FullName)。请自行确定如何同步。" }
            if ($item.PSIsContainer) { $queue.Enqueue($item.FullName) }
        }
    }
    $json = ConvertTo-Json -InputObject @($empty | Sort-Object) -Compress
    [IO.File]::WriteAllText((Join-Path $script:Root '.filesync-empty-dirs.json'), $json + "`n", $utf8)
}

function Restore-EmptyDirs {
    $manifest = Join-Path $script:Root '.filesync-empty-dirs.json'
    if (-not (Test-Path -LiteralPath $manifest)) { return }
    [string[]]$dirs = ConvertFrom-Json -InputObject (Get-Content -LiteralPath $manifest -Raw -Encoding UTF8)
    foreach ($dir in $dirs) {
        $path = [IO.Path]::GetFullPath((Join-Path $script:Root $dir))
        if (-not $path.StartsWith($script:Root.TrimEnd('\') + '\', [StringComparison]::OrdinalIgnoreCase)) { throw '空目录清单含有目标目录之外的路径。' }
        [IO.Directory]::CreateDirectory($path) | Out-Null
    }
}

function Get-LargeInstallers {
    $extensions = @('.msix', '.misx', '.msixbundle', '.appx', '.appxbundle', '.exe', '.msi', '.msp')
    $queue = New-Object 'System.Collections.Generic.Queue[string]'
    $queue.Enqueue($script:Root)
    while ($queue.Count) {
        foreach ($item in @(Get-ChildItem -LiteralPath $queue.Dequeue() -Force)) {
            if ($item.Name -eq '.git' -or ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) { continue }
            if ($item.PSIsContainer) { $queue.Enqueue($item.FullName) }
            elseif ($item.Length -gt 100MB -and $item.Extension.ToLowerInvariant() -in $extensions) {
                $item.FullName.Substring($script:Root.Length + 1).Replace('\', '/')
            }
        }
    }
}

function Update-InstallerIgnore {
    param([string[]]$Paths)
    $ignorePath = Join-Path $script:Root '.gitignore'
    $old = ''
    if (Test-Path -LiteralPath $ignorePath) { $old = [IO.File]::ReadAllText($ignorePath) }
    $pattern = '(?ms)^# FileSync: large installers begin\r?\n.*?^# FileSync: large installers end(?:\r?\n|$)'
    $text = [regex]::Replace($old, $pattern, '')
    if ($Paths.Count) {
        if ($text.Length -and -not $text.EndsWith("`n")) { $text += "`n" }
        $lines = @('# FileSync: large installers begin', '# Installers larger than 100 MiB; local files are retained')
        foreach ($path in @($Paths | Sort-Object)) {
            $lines += '/' + [regex]::Replace($path, '([*?\[\]#! ])', '\$1')
        }
        $lines += '# FileSync: large installers end'
        $text += ($lines -join "`n") + "`n"
    }
    if ($text -cne $old) { [IO.File]::WriteAllText($ignorePath, $text, $utf8) }
}

function Save-Changes {
    Require-Repo
    $null = Invoke-Git @('var', 'GIT_AUTHOR_IDENT') -Capture
    Invoke-Git @('remote', 'get-url', 'origin')
    if ($Target -eq 'Codex') {
        $auth = @(Invoke-Git @('ls-files', '--', 'auth.json') -Capture)
        if ($auth.Count) { throw 'auth.json 已被跟踪，请先从仓库和历史中处理登录凭据，再同步。' }
        Update-CodexRules
        Check-CodexConfig
        Export-MemorySnapshot
        Export-FileSyncTool
    } else {
        $installers = @(Get-LargeInstallers)
        Update-InstallerIgnore -Paths $installers
        foreach ($path in $installers) {
            Write-Host ("跳过大安装包（保留本地文件）：" + $path) -ForegroundColor Yellow
            Invoke-Git @('rm', '--cached', '--ignore-unmatch', '--', $path)
        }
        Save-EmptyDirs
    }
    $listArgs = @('ls-files', '--cached', '--others')
    if ($Target -eq 'Codex') { $listArgs += '--exclude-standard' }
    $paths = @(Invoke-Git $listArgs -Capture)
    foreach ($path in $paths) {
        if ($Target -eq 'Documents' -and $path -in $installers) { continue }
        $file = Join-Path $script:Root $path
        if ((Test-Path -LiteralPath $file -PathType Leaf) -and (Get-Item -LiteralPath $file -Force).Length -gt 100MB) { throw "文件超过 GitHub 普通 Git 的 100 MiB 限制：$path。请自行配置 Git LFS。" }
    }
    $addArgs = @('add', '-A')
    if ($Target -eq 'Documents') {
        $addArgs += @('-f', '--', '.')
        foreach ($path in $installers) { $addArgs += ':(top,literal,exclude)' + $path }
    }
    $stamps = @{}
    if ($Target -eq 'Codex') {
        foreach ($path in $paths) {
            $file = Join-Path $script:Root $path
            if (Test-Path -LiteralPath $file -PathType Leaf) {
                $item = Get-Item -LiteralPath $file -Force
                $stamps[$path] = [string]$item.Length + ':' + $item.LastWriteTimeUtc.Ticks
            }
        }
    }
    Invoke-Git $addArgs
    if ($Target -eq 'Codex') {
        foreach ($path in $stamps.Keys) {
            $file = Join-Path $script:Root $path
            if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw '备份期间文件被移走，本轮未提交或上传，请稍后重试。' }
            $item = Get-Item -LiteralPath $file -Force
            $stamp = [string]$item.Length + ':' + $item.LastWriteTimeUtc.Ticks
            if ($stamp -cne $stamps[$path]) { throw '备份期间文件仍在写入，本轮未提交或上传，请稍后重试。' }
        }
    }
    $changed = @(Invoke-Git @('diff', '--cached', '--name-only') -Capture)
    if ($changed.Count) {
        if (-not $Message) { $Message = 'sync ' + $Target + ' ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss') }
        Invoke-Git @('commit', '-m', $Message)
    } else { Write-Host '没有新的文件修改；仍会推送之前尚未上传的提交。' }
}

$syncMutex = $null
$mutexHeld = $false
$transcript = $false
try {
    if ($NonInteractive) {
        $env:GIT_TERMINAL_PROMPT = '0'
        $env:GCM_INTERACTIVE = 'Never'
        if (-not $env:GIT_SSH_COMMAND) { $env:GIT_SSH_COMMAND = 'ssh -o BatchMode=yes' }
        if ($Action -in @('Menu', 'Init', 'FirstConnect')) { throw '定时模式不接受菜单或初始化；请先手动完成配置和登录。' }
    }
    if ($Log) {
        $logDir = Join-Path $PSScriptRoot 'logs'
        [IO.Directory]::CreateDirectory($logDir) | Out-Null
        Get-ChildItem -LiteralPath $logDir -Filter 'sync-*.txt' | Sort-Object LastWriteTime -Descending | Select-Object -Skip 9 | Remove-Item
        $logPath = Join-Path $logDir ('sync-' + (Get-Date -Format 'yyyyMMdd-HHmmss-fff') + '-' + [Guid]::NewGuid().ToString('N').Substring(0,6) + '.txt')
        Start-Transcript -LiteralPath $logPath | Out-Null
        $transcript = $true
    }
    if ($Action -eq 'Menu') {
        Write-Host '1 = 文档\Codex，2 = 用户目录\.codex'
        Write-Host '3 = 一键同步两个目录，4 = 一键下载两个目录'
        Write-Host '5 = 启用定时同步，6 = 关闭定时同步'
        Write-Host '7 = 升级/准备 .codex 快照，8 = 恢复记忆快照'
        Write-Host '9 = 首次接入 .codex（先备份，以远程为准）'
        Write-Host '10 = 恢复聊天索引和原始标题，0 = 退出'
        $choice = Read-Host '选择（默认 1）'
        if ($choice -eq '0') { exit 2 }
        if ($choice -in @('5', '6')) {
            $mode = 'Enable'
            if ($choice -eq '6') { $mode = 'Disable' }
            & (Join-Path $PSHOME 'powershell.exe') -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'schedule.ps1') -Mode $mode
            exit $LASTEXITCODE
        }
        if ($choice -in @('7', '8', '9', '10')) {
            $Target = 'Codex'
            $Action = 'Prepare'
            if ($choice -eq '8') { $Action = 'RestoreMemory' }
            if ($choice -eq '9') { $Action = 'FirstConnect' }
            if ($choice -eq '10') { $Action = 'RestoreChats' }
        } elseif ($choice -in @('3', '4')) {
            $Target = 'All'
            $Action = 'Sync'
            if ($choice -eq '4') { $Action = 'Pull' }
        } else {
            if ($choice -eq '2') { $Target = 'Codex' } elseif ($choice -notin @('', '1')) { throw '目录选项无效。' }
            Write-Host '选择操作：1 = 初始化，2 = 查看状态，3 = 下载，4 = 上传，5 = 同步，6 = 准备快照（.codex），7 = 恢复记忆（.codex），0 = 退出'
            switch (Read-Host '操作') {
                '0' { exit 2 }
                '1' { $Action = 'Init' }
                '2' { $Action = 'Status' }
                '3' { $Action = 'Pull' }
                '4' { $Action = 'Push' }
                '5' { $Action = 'Sync' }
                '6' { $Action = 'Prepare' }
                '7' { $Action = 'RestoreMemory' }
                default { throw '操作选项无效。' }
            }
        }
    }
    if ($Target -eq 'All') {
        if ($Root -or $Action -in @('Init', 'Prepare', 'RestoreMemory', 'FirstConnect', 'RestoreChats')) { throw '两个目录请分别初始化；自定义路径用 -DocumentsRoot 和 -CodexRoot。' }
        $failed = $false
        $summary = New-Object 'System.Collections.Generic.List[string]'
        foreach ($item in @('Documents', 'Codex')) {
            Write-Host ("`n===== " + $item + " =====") -ForegroundColor Cyan
            $childArgs = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $PSCommandPath, '-Target', $item, '-Action', $Action)
            $childRoot = $DocumentsRoot
            if ($item -eq 'Codex') { $childRoot = $CodexRoot }
            if ($childRoot) { $childArgs += @('-Root', $childRoot) }
            if ($Message) { $childArgs += @('-Message', $Message) }
            if ($NonInteractive) { $childArgs += '-NonInteractive' }
            & (Join-Path $PSHOME 'powershell.exe') @childArgs
            $code = $LASTEXITCODE
            if ($code -eq 0) { $summary.Add($item + '：完成') }
            else { $summary.Add($item + '：失败，请查看上方错误'); $failed = $true }
        }
        Write-Host "`n===== 本轮结果 =====" -ForegroundColor Cyan
        $summary | ForEach-Object { Write-Host $_ }
        if ($failed) { exit 1 }
        exit 0
    }
    if (-not $Root) {
        if ($Target -eq 'Documents') { $Root = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Codex' }
        elseif ($env:CODEX_HOME) { $Root = $env:CODEX_HOME }
        else { $Root = Join-Path $env:USERPROFILE '.codex' }
    }
    $script:Root = [IO.Path]::GetFullPath($Root).TrimEnd('\', '/')
    if ($Action -eq 'FirstConnect' -and $Target -eq 'Codex' -and -not $NonInteractive -and -not (Test-Path -LiteralPath $script:Root)) { [IO.Directory]::CreateDirectory($script:Root) | Out-Null }
    if (-not (Test-Path -LiteralPath $script:Root -PathType Container)) { throw "目录不存在：$script:Root" }
    $command = Get-Command git.exe -ErrorAction SilentlyContinue
    if ($command) { $script:Git = $command.Source }
    else {
        $script:Git = @(
            (Join-Path $env:ProgramFiles 'Git\cmd\git.exe'),
            (Join-Path $env:LOCALAPPDATA 'Programs\Git\cmd\git.exe')
        ) | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
    }
    if (-not $script:Git) { throw '没有找到 Git，请安装 Git 或把 git.exe 加入 PATH。' }
    if ($Action -in @('Prepare', 'RestoreMemory', 'FirstConnect', 'RestoreChats') -and $Target -ne 'Codex') { throw '此操作只用于 .codex。' }
    $liveCodex = Join-Path $env:USERPROFILE '.codex'
    if ($env:CODEX_HOME) { $liveCodex = $env:CODEX_HOME }
    $codexRunning = $false
    if ($Target -eq 'Codex' -and $script:Root -ieq ([IO.Path]::GetFullPath($liveCodex).TrimEnd('\', '/'))) {
        $codexRunning = [bool](Get-Process -Name codex -ErrorAction SilentlyContinue)
    }
    if ($Target -eq 'Codex' -and $Action -in @('Pull', 'RestoreMemory', 'FirstConnect', 'RestoreChats') -and $codexRunning) {
        throw '请先退出 Codex，再下载、首次接入或恢复记忆。'
    }
    if ($Target -eq 'Codex' -and $Action -eq 'Sync' -and ($NonInteractive -or $codexRunning)) {
        $Action = 'Push'
        Write-Host '在线备份模式：导出记忆并上传本机文件；本轮不下载或覆盖正在使用的文件。' -ForegroundColor Yellow
    }
    if ($Action -in @('Init', 'Pull', 'Push', 'Sync', 'Prepare', 'RestoreMemory', 'FirstConnect', 'RestoreChats')) {
        $sha = [Security.Cryptography.SHA256]::Create()
        $lockId = ([BitConverter]::ToString($sha.ComputeHash($utf8.GetBytes($script:Root.ToLowerInvariant())))).Replace('-', '')
        $sha.Dispose()
        $syncMutex = New-Object Threading.Mutex($false, ('Local\FileSync-' + $lockId))
        $mutexHeld = $syncMutex.WaitOne(0)
        if (-not $mutexHeld) { throw '该目录已有同步操作正在运行，本轮停止。' }
    }
    Write-Host "目录：$script:Root" -ForegroundColor Cyan
    Write-Host "操作：$Action"
    switch ($Action) {
        'Init' {
            if (-not (Test-Path -LiteralPath (Join-Path $script:Root '.git'))) { Invoke-Git @('init', '-b', 'main') }
            Require-Repo
            Invoke-Git @('config', 'core.autocrlf', 'false')
            Invoke-Git @('config', 'pull.ff', 'only')
            $ignore = Join-Path $script:Root '.gitignore'
            if ($Target -eq 'Codex') { Update-CodexRules; Export-MemorySnapshot; Export-FileSyncTool }
            $attrs = Join-Path $script:Root '.gitattributes'
            if (-not (Test-Path -LiteralPath $attrs)) { [IO.File]::WriteAllText($attrs, "* -text`n", $utf8) }
            $remotes = @(Invoke-Git @('remote') -Capture)
            if ('origin' -notin $remotes) {
                if (-not $RemoteUrl) { $RemoteUrl = Read-Host '粘贴此目录对应的空私有仓库地址（直接回车暂不设置）' }
                if ($RemoteUrl) { Invoke-Git @('remote', 'add', 'origin', $RemoteUrl.Trim()) }
            } else { Invoke-Git @('remote', '-v') }
            Write-Host '初始化完成。首次上传选择“上传”。第二个目录使用另一个仓库。' -ForegroundColor Green
        }
        'FirstConnect' { Start-CodexFirstConnect }
        'Prepare' {
            Require-Repo
            Update-CodexRules
            Check-CodexConfig
            Export-MemorySnapshot
            Export-FileSyncTool
            Write-Host '规则、记忆和工具快照已准备；尚未提交或上传。' -ForegroundColor Green
        }
        'RestoreMemory' { Require-Repo; Restore-MemorySnapshot }
        'RestoreChats' { Require-Repo; Restore-ChatIndex }
        'Status' { Require-Repo; Invoke-Git @('status', '--short', '--branch'); Invoke-Git @('remote', '-v') }
        'Pull' {
            Require-Repo
            $statusArgs = @('status', '--porcelain')
            if ($Target -eq 'Documents') {
                $statusArgs += @('--ignored', '--', '.')
                foreach ($path in @(Get-LargeInstallers)) { $statusArgs += ':(top,literal,exclude)' + $path }
            }
            $dirty = @(Invoke-Git $statusArgs -Capture)
            if ($dirty.Count) { throw '目录内有未提交的修改，请先上传或自行处理，再下载。' }
            Invoke-Git @('pull', '--ff-only')
            if ($Target -eq 'Documents') { Restore-EmptyDirs }
            if ($Target -eq 'Codex') { Write-Host '下载只更新备份文件；主菜单 8 恢复记忆，10 恢复聊天索引和标题。' -ForegroundColor Yellow }
            Write-Host '下载完成。' -ForegroundColor Green
        }
        'Push' {
            Save-Changes
            Invoke-Git @('push', '-u', 'origin', 'HEAD')
            Write-Host '上传完成。' -ForegroundColor Green
        }
        'Sync' {
            if ($Target -eq 'Documents') { Restore-EmptyDirs }
            Save-Changes
            Invoke-Git @('fetch', 'origin')
            $branch = [string](Invoke-Git @('symbolic-ref', '--short', 'HEAD') -Capture)
            $remoteRef = 'refs/remotes/origin/' + $branch
            $remoteHead = @(Invoke-Git @('rev-parse', '--verify', '--quiet', $remoteRef) -Capture -Allowed @(0,1))
            if ($remoteHead.Count) {
                Invoke-Git @('merge', '--ff-only', $remoteRef)
                if ($Target -eq 'Documents') { Restore-EmptyDirs }
            }
            Invoke-Git @('push', '-u', 'origin', 'HEAD')
            if ($Target -eq 'Codex') { Write-Host '若下载了另一台电脑的新记忆，请选主菜单 8 恢复后再继续使用。' -ForegroundColor Yellow }
            Write-Host '同步完成。' -ForegroundColor Green
        }
    }
    exit 0
} catch {
    Write-Host ('同步停止：' + $_.Exception.Message) -ForegroundColor Red
    Write-Host '可以在目标目录用 Git Bash 执行 git status 排查。工具不会强推、自动合并冲突或重置你的修改。'
    exit 1
} finally {
    if ($mutexHeld) { $syncMutex.ReleaseMutex() }
    if ($syncMutex) { $syncMutex.Dispose() }
    if ($transcript) { Stop-Transcript | Out-Null }
}
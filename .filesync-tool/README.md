# 手动 Git 同步

双击 `sync.cmd`，选择目录，再选择初始化、查看状态、下载或上传。操作完成（或出错）后按任意键返回，清屏重新显示主菜单；目录和操作菜单均可输入 `0` 退出。命令行带参数调用仍只执行一次。工具通过本机 Git 执行命令，终端会显示错误，不自动修复冲突。

## 同步范围

- **目录 1：文档\Codex**。包括子目录、文件和空文件夹；超过 100 MiB 的安装包除外，使用一个仓库。
- **目录 2：用户目录\.codex**。优先使用环境变量 `CODEX_HOME`，否则使用 `%USERPROFILE%\.codex`；使用另一个仓库。
- 两个仓库相互独立。“文档”的其他目录不属于同步目标。文档\\Codex 会包含被 Git 忽略规则排除的普通文件（包括 exe），但会排除超过 100 MiB 的安装包。

`.codex` 默认同步根目录 AGENTS.md、config.toml、hooks.json、history.jsonl、session_index.jsonl 和同步规则，以及 sessions、archived_sessions、attachments、rules、自定义 skills、prompts、instructions、agents、profiles、hooks。聊天同时收录 `.jsonl` 与 `.jsonl.zst`，按原始字节保存。自带 skills/.system、程序缓存、auth.json、cap_sid、SQLite 与应用运行状态排除。配置不再按扩展名笼统放行；其他明确由你维护的配置，可在 `.codex/.gitignore` 的 FileSync 区块后逐个添加，例如 `!/settings.yaml`，上传前检查内容。

`memories/` 使用 `.codex/.filesync-memories/` 中的文件快照同步，包含普通记忆文件、自定义技能和摘要；快照排除任何层级的 .git、.system、认证文件及 SQLite。原 memories/.git 保留。下载只更新快照，恢复到实际 memories 必须单独手动执行。

Codex 配置可能包含你手动填写的密钥；使用私有仓库，并自行检查配置内容。日常同步按原始字节备份文件；换电脑后可用主菜单 10 重建本机聊天列表、正文索引和原始标题。数据库仍不跨电脑同步，也不自动改写项目路径。

## 第一台电脑：第一次设置

1. 在 GitHub 新建两个**空私有仓库**，例如 `codex-documents-sync` 和 `codex-state-sync`。不要自动添加 README、许可证或 .gitignore。不要复用非空 fork 或教学用仓库。
2. 双击 `sync.cmd`，选目录 1，再选初始化；粘贴第一个仓库的地址。
3. 再选目录 1、上传，完成首次提交和上传。
4. 在工具里选目录 2、初始化，粘贴第二个仓库地址，然后选目录 2、上传；允许 Codex 在线运行。

文档\Codex 的本地仓库若已经由助手初始化，仍可以选择初始化来填写远程地址。Git 姓名和邮箱沿用你的现有配置；若缺少，按 Git 错误提示设置。

## 日常使用

- 开始工作前：下载需要使用的目录。
- 上传备份允许 Codex 在线运行；最好等当前回复完成后操作。下载、首次导入、恢复记忆或修复正文索引前先退出 Codex；在线备份不受影响。
- 从电脑 A 换到 B：A 上传完，B 再下载。不要同时修改同一条会话。
- Git 删除文件的记录也会同步。文档\Codex 的空文件夹通过 `.filesync-empty-dirs.json` 保存并在下载后重建；它不会删除已存在的空文件夹。
- `.codex` 不保存无内容的空文件夹。
- 初始化不提交、上传文件。上传 = 暂存全部目标内容、必要时提交、正常推送；下载 = 检查工作区干净、`git pull --ff-only`。
- 没有修改时，“上传”仍会重试之前尚未成功推送的提交。

## 第二台电脑：首次接入

先把完整 FileSync 工具目录复制到新电脑。文档目录仍可在目标不存在时克隆（地址和路径换成自己的）：

```bash
git clone https://github.com/你的用户名/codex-documents-sync.git "$HOME/Documents/Codex"
```

对于已经由应用生成文件的 .codex，使用新入口：

1. 先在原电脑用新版工具完成一次上传，确保远程已有 .filesync-memories/manifest.json 和记忆文件。
2. 在新电脑关闭 Codex，双击 sync.cmd，选主菜单 **9 = 首次接入 .codex（先备份，以远程为准）**。
3. 粘贴**已有的 .codex 同步仓库地址**；不是新建空仓库。工具先克隆到临时目录并验证，再自动备份本机受管配置、聊天、附件、技能和记忆。
4. 导入远程受管文件和 Git 历史，并恢复远程记忆。本机仅有的受管聊天和记忆也会从实际目录移走，以远程为准；原内容留在备份。认证、安装程序、数据库和缓存保留，原 memories/.git 始终保留。
5. 检查 config.toml 的本机绝对路径后再启动 Codex；缺少登录状态时重新登录。

原文件在 FileSync/first-connect-backups/时间戳/files，source-path.txt 记录原目录；原来若有尚无提交的外层 .git，则另存 original-outer-git。备份可能包含旧配置和会话，不会自动上传，请在确认迁移完成后自行决定何时删除。导入中途失败时会尝试还原；若自动还原失败，错误会显示备份路径，可从中手动恢复。

此入口只用于尚无外层 Git 提交历史的新目录，不替换已有同步仓库的历史，也不会执行强推、创建提交或上传。已初始化但尚未提交的空仓库可以接入。远程仍含旧 memories gitlink、认证数据、链接或超出默认白名单的自定义文件时会拒绝导入，先在原电脑处理并上传；额外配置可另行迁移。远程配置含疑似明文凭据时也会停止。

如果已完成接入，日常继续使用一键同步或普通下载。普通 pull 始终要求工作区干净，并使用 --ff-only，分叉时停止。文档空目录仍在首次下载后重建。

## 命令行用法

在 PowerShell 中（把路径换成工具实际位置）：

```powershell
& "$HOME\Documents\FileSync\sync.cmd" -Target Documents -Action Status
& "$HOME\Documents\FileSync\sync.cmd" -Target Documents -Action Pull
& "$HOME\Documents\FileSync\sync.cmd" -Target Documents -Action Push
& "$HOME\Documents\FileSync\sync.cmd" -Target Codex -Action Init
& "$HOME\Documents\FileSync\sync.cmd" -Target Codex -Action Push
```

`-Root` 可以指定实际目标目录，`-Message` 可以指定提交说明。Git 没加入 PATH 时，工具会尝试标准安装位置 `C:\Program Files\Git\cmd\git.exe`。

## 出错时

进入出错目录，用 Git Bash 查看 `git status`、`git remote -v`。两边历史分叉时，工具会停止；可以自行用 `git pull --no-rebase` 合并、解决冲突，再上传。没有配置上游时，确认远程分支名后执行 `git branch --set-upstream-to=origin/main main`。文档\\Codex 中超过 100 MiB 的安装包（msix、misx、msixbundle、appx、appxbundle、exe、msi、msp，不区分大小写）会自动跳过并写入 .gitignore 的 FileSync 区块，本地文件保留；小安装包仍同步。已跟踪的大安装包会停止跟踪，但这一步不删除旧历史中的对象。其他超过 100 MiB 的文件仍会报错，需自行处理或配置 Git LFS。已有 .gitignore 的其他规则保留。

升级时会把已跟踪但现已排除的文件从外层 Git 索引移除，保留本地文件；memories 的 gitlink 也仅从外层索引移除。旧提交中的缓存不会因此立即消失。若 auth.json 或 cap_sid 已被跟踪，工具会停止，需另外清理凭据和历史。config.toml 的常见明文凭据字段会拦截上传，但这不是完整的秘密检测，请自行检查自定义配置。

## 一键同步与定时运行

双击 `sync-all.cmd`，或在主菜单输入 **3**，会依次同步两个目录，并汇总各自完成、跳过或失败的状态。单独一个目录的操作菜单也新增 **5 = 同步**。主菜单 **4** 可以一次下载两个目录。

“同步”执行：保存本地修改并创建提交 → 获取远程更新 → 可以快进时更新本地 → 正常上传。空远程也支持首次上传。本地和远程都有独立提交时会停止，保留本地提交；需你手动合并。两个目录独立处理，一个失败仍会尝试另一个，不保证两个仓库同时成功。

### 设置定时同步

1. 先手动“一键同步”成功，确保两个远程仓库和 GitHub 登录均正常。
2. 在主菜单选择 **5 = 启用定时同步**，输入每天的时间，格式为 24 小时制 `HH:mm`，例如 `22:00`。
3. 需要停止时，选 **6 = 关闭定时同步**。

这是本机 Windows 任务计划程序，按电脑本地时间每天运行一次。首次从下一个所填时间开始；如果今天已过该时间，首次是明天。电脑需开机、联网、当前用户已登录；关机期间不会运行，错过后 Windows 会在条件恢复时补跑。再次选择 5 会替换原任务的时间（也会替换旧的间隔任务）。程序不会要求你输入或保存 Windows 密码，也不会在本次制作工具时自动启用。

后台会记录 `FileSync\logs\sync-*.txt`，最多保留最近 10 份。不会弹出登录提示；登录失效、冲突或网络错误会写入日志，需要你手动排查。

定时任务的 .codex 操作现为在线备份：即使 Codex 正在运行，也会导出记忆快照、暂存并上传；不下载远程文件、不恢复记忆。手动“一键同步”检测到本机 Codex 进程运行时，.codex 同样只上传。检测到暂存期间文件长度或修改时间变化时，本轮停止提交和上传，保留本地文件及暂存状态，下一次备份会重新暂存。其他客户端可能不使用 codex.exe 进程，请自行在下载和恢复前关闭正在写这些文件的应用。

若另一台电脑已上传新提交，在线备份的正常推送可能被拒绝。这时先退出 Codex，手动处理下载或历史分叉，再继续备份；工具不会强推。文档目录仍按原来的双向同步执行。

同一目录的并发同步会停止后来的操作；定时任务也不会重叠执行。未改动时不会新建提交；文档目录仍检查远程更新，后台 .codex 仅重试正常推送。任务运行超过 30 分钟会由 Windows 停止。启用后请保留工具所在路径，搬动工具后需重新启用。

命令行示例（后台模式没有 pause）：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$HOME\\Documents\\FileSync\\sync.ps1" -Target All -Action Sync
powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "$HOME\\Documents\\FileSync\\sync.ps1" -Target All -Action Sync -NonInteractive -Log
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$HOME\\Documents\\FileSync\\schedule.ps1" -Mode Enable -DailyTime "22:00"
```

`-DocumentsRoot` 和 `-CodexRoot` 可用于一键操作时指定两个自定义目录；单目录仍使用 `-Root`。默认定时任务使用 Windows 的文档路径与 CODEX_HOME/用户目录，不保存这两个自定义参数。

## 记忆快照升级与恢复（v2）

本机工具升级后，主菜单 **7 = 升级/准备 .codex 快照** 会更新规则、解除外层 memories 版本指针、移除自带技能的跟踪，并导出完整记忆快照。不会创建提交或上传；随后选 **3 = 一键同步** 完成提交与上传。原 memories/.git 和记忆内容保持原样。已有每日定时任务会继续调用同一路径的新版脚本。

日常上传 .codex 时会自动更新规则并导出快照；原始文件没有改动时不会新增提交。附件若超过普通 Git 的 100 MiB 限制，工具会报错，需另行备份或自行使用 LFS。

换电脑时：先退出 Codex，再下载，选主菜单 **8 = 恢复记忆快照**。恢复前逐文件对照 SHA-256 基线；本机存在尚未备份的不同内容时，整次恢复在写入前停止。恢复会应用快照中相对基线的文件删除；原文件另存到外层 Git 目录的 filesync-memory-backups/时间戳/files，原 memories/.git 始终保留。备份不上传，可在确认无需回退后自行删除。

下载了尚未恢复的新快照时，后续上传会停止，避免把本机旧记忆重新覆盖到快照。若两台机器都修改了内容，先另存本机记忆，再手动比较处理；工具不强制覆盖，也不自动合并。纯下载后实际 memories 不变；它内部的 .git 状态在恢复后可能显示修改，需由原来的记忆管理流程处理。

命令行：
```powershell
& "$HOME\Documents\FileSync\sync.cmd" -Target Codex -Action Prepare
& "$HOME\Documents\FileSync\sync.cmd" -Target Codex -Action RestoreMemory
```

此方案备份文件；不跨电脑覆盖 SQLite、项目 ID 映射或应用完整状态。聊天侧栏、正文索引和原始标题可用主菜单 10 在目标电脑重建。


首次接入的命令行形式（先退出 Codex，已有外层提交历史时会拒绝）：

```powershell
& "$HOME\Documents\FileSync\sync.cmd" -Target Codex -Action FirstConnect -RemoteUrl "https://github.com/你的用户名/codex-state-sync.git"
```


## 2026-10-17 补充同步范围

- `.chatgpt-projects/*/AGENTS.md`：只收录项目指令，不收录项目 ID 映射和本机元数据。
- `generated_images/`、`visualizations/`、`pets/`：保留作品、自定义资源。空目录不增加上传流量；单文件超过 100 MiB 仍会停止并提示，不悄悄漏掉文件。
- `.filesync-tool/`：自动保存本工具的 8 个发布文件，不含日志、测试目录和本机备份。换电脑后可从这里复制完整工具到文档/FileSync；下载不会自动执行或覆盖已安装脚本。
- `.filesync-memory-archive/`：更新记忆快照前，将被替换或移除的旧文件另存为带哈希清单的历史备份。它参与 Git 同步，但不会自动恢复到 `memories/`，避免旧指令重新生效。未改变的内容不会重复生成备份。

原有聊天、归档、附件、自定义技能仍同步；`.jsonl.zst` 压缩记录原本就在范围内。认证数据、程序和插件缓存、运行中的数据库继续排除。这里只备份插件自定义技能和独立保存的源码，不同步插件安装缓存。超过 100 MiB 安装包的跳过规则不变。

### 换电脑后恢复聊天正文、列表和标题

完成下载或首次接入后，在主菜单选择 **10 = 恢复聊天正文、索引和原始标题**。这个操作需要 Python 3.8 或以上、新版 Git 和可运行的 Codex 引擎；请先启动一次 Codex，让它创建本机数据库。修复本机正文索引前请退出 Codex；`--check-only` 隔离检查允许在线进行。日常同步仍只需要 Git 和 PowerShell。

它会在隔离副本中，按依赖顺序逐个重放普通、压缩和归档记录的全部祖先片段，再重放最新片段；不能只读取最新片段，否则可能只剩最后几轮。验证以原始日志引用的精确字节范围为准，逐条核对用户与助手消息的 ID、正文及附件引用，而不是仅比较两次接口读取结果。当前片段没有消息时也会继续恢复其引用的祖先历史。验证通过后，先用 SQLite 一致性备份保存本机数据库，再只修复索引，并从 `session_index.jsonl` 恢复标题。不会发送新提示词或运行模型；本机原始聊天文件、会话 ID 和归档状态保留，不上传数据库。备份及 `report.json` 保存在 `.codex/.filesync-chat-backups/时间戳/`，这部分不上传。

扫描期间原文发生变化，或本机已有消息与恢复结果不同的会话会跳过；写入期间再次变化则事务回滚。它只能恢复现有原始日志包含的内容，不会补写缺失的对话。完成后重新打开会话刷新显示，若仍显示旧缓存，可退出再打开 Codex。排查时可单独运行 `repair-chat-index.py --root "$HOME\.codex" --check-only`，只验证隔离副本，不修改本机索引。

这是针对当前本机数据库结构的修复工具，不等同于完整迁移。历史引用缺失、原生重放失败或原文核对不一致时，会停止本次修复，不回填未通过检查的正文；缺少原始标题时保留客户端提取的标题，不编造原名。客户端将来变更接口或数据库结构时，工具可能停止并保留备份。

命令行：
```powershell
& "$HOME\Documents\FileSync\sync.cmd" -Target Codex -Action RestoreChats
```


## 驱动与运行库备份排除

文档/Codex 中 `*/data/repairs/*/previous-*-driver/` 和 `*/data/repairs/*/runtime-数字*/` 属于可重新安装的驱动、运行库备份，现按目录排除；本地文件保留，修复记录、脚本和普通项目文件继续同步。超过 100 MiB 安装包仍按原规则跳过。这些排除同时用于上传和下载前的状态检查，不受强制暂存普通文档的参数影响。

只停止跟踪不会移除旧提交中的文件。清理历史后，其他电脑不要直接合并旧历史，否则可能重新带回大对象；先备份未上传文件，再重新克隆清理后的文档仓库，并复制自己的新文件。`.codex` 仓库不受这次文档历史清理影响。

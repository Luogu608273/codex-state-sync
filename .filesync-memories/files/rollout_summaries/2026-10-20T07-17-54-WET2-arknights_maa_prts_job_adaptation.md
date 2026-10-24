thread_id: 01a1582c-844c-7c13-b25b-67921b416404
updated_at: 2026-10-23T11:11:02+00:00
rollout_path: \\?\C:\Users\605\.codex\sessions\2026\10\20\rollout-2026-10-20T15-17-55-01a1582c-844c-7c13-b25b-67921b416404.jsonl
cwd: \\?\C:\Users\605\Documents\Codex\MAA Arknights Assistant!
git_branch: main

# 明日方舟 MAA 作业适配与迭代修改

Rollout context: 在 `C:\Users\605\Documents\Codex\MAA Arknights Assistant!` 中，用户要求更新一图流数据、读取 PRTS 作业并根据地图与自身练度修改 MAA 作业；所有作业均只做静态生成与校验，未实战运行。

## Task 1: 为 prts://51044 加入结城理并适配突袭

Outcome: partial

Preference signals:

- 用户要求“读取地图信息，修改作业在合适的位置部署结城理”，并强调“同时修改作业的干员适配等信息” -> 类似任务应同步修改 `opers`、技能、模组、练度、助战和说明，而不是只添加一个部署动作。
- 用户在失败原因不明时选择“按地图和练度判断” -> 可基于路线、地图覆盖和已知练度做明确但标注待实测的方案，不必强行追问无法提供的失败细节。

Key steps:

- 读取并解析 PRTS 作业 51044，确认关卡为 GO-EX-7「分别计算」对应的 `act37side_ex07`，原阵容为维什戴尔、逻各斯、克洛丝及盾位。
- 于 2026-10-20 更新一图流快照：HTTP/业务状态均为 200，共 228 条记录；自有数据确认逻各斯精二60、1技能专三、Δ模组三级，结城理精二60、3技能专三、Y模组三级；维什戴尔需借用。
- 依据突袭地图、路线和结城理三技能替身范围，将结城理加入 `(7,4)`、朝下；固定盾位改为自有塞雷娅；保留原四人部署顺序，并设置结城理 3 技能好了就用。
- 生成 `data/copilot-51044/GO-EX-7-raid-makoto.json`、`adaptation.json`、`validation.json` 和可复现脚本 `build_adapted.py`。
- 静态校验通过：JSON、干员引用、部署格合法性、范围覆盖、4名自有干员+1名助战、部署上限预算均通过；未实战验证。

Failures and how to do differently:

- 试图用 MAA Python SDK 校验时失败：当前 `py.exe` 只发现 Python 3.8，而安装目录 SDK 使用 `bytes | None` 等 3.10+ 类型注解，导致导入时报 `TypeError: unsupported operand type(s) for |: 'type' and 'NoneType'`。未来不要把 SDK 核心加载或作业可执行性说成已验证，除非使用兼容 Python 版本。
- 用户提供过只读 API 密钥；密钥被写入 `.secrets/yituliu-readonly.key` 并加入 `.gitignore`。未来记忆和导出文件不得保存或复述该密钥。

Reusable knowledge:

- 一图流 API：`GET https://backend.yituliu.cn/open-api/operator/info`，`Authorization` 头直接放只读密钥、不加 Bearer；公开 PRTS 查询接口无需该密钥。
- PRTS 作业详情的 `content` 是 JSON 字符串，需要二次解析；作业链接格式为 `https://prts.plus/?op=<id>`。
- MAA v3 模组编号约定：`0` 初始、`1` X、`2` Y、`3` A、`4` D；`requirements` 可写模组类型但当前核心不校验模组等级。
- 作业必须明确标注“静态校验通过、未实战验证”，不能把生成成功、`start()` 成功或任务结束当作通关证据。

References:

- `data/copilot-51044/GO-EX-7-raid-makoto.json`
- `data/copilot-51044/README.md`
- `data/copilot-51044/validation.json`
- `data/operators-2026-10-20.json`（228 条快照）
- MAA 报错：`TypeError: unsupported operand type(s) for |: 'type' and 'NoneType'`

## Task 2: 为 prts://104914 的 TW-EX-7 加入凛御银灰、小车及塞雷娅

Outcome: partial

Preference signals:

- 用户要求“加入凛御银灰和小车，并在合适的位置部署凛御银灰，并设置技能好自动开” -> 未来应同时处理部署位置、首次显式开技能与后续 `SkillUsage: 1` 自动开，而不是只设置单次技能动作。
- 用户后续明确“注意塞雷娅不要奶到结城理” -> 这是本任务的关键硬约束：选位和技能范围必须用坐标/范围数据验证，不能只凭朝向推断；塞雷娅应使用二技能，避免三技能范围覆盖结城理。

Key steps:

- 更新 2026-10-23 一图流快照：HTTP/业务状态 200，共 229 条记录；读取作业 104914，确认关卡为 TW-EX-7「分别计算」，原阵容为圣聆初雪和结城理。
- 确认自有：圣聆初雪精二60、2技能专三、Y模组三级；结城理精二60、3技能专三、Y模组三级；Lancet-2 精零1级；塞雷娅精二60、1技能专三、2技能7级；凛御银灰需要助战。
- 将凛御银灰放在 `(7,3)`、朝右；先显式开启一次3技能，再设置 `SkillUsage:1` 使后续技能好了自动开；Lancet-2 只编入待部署区、不部署，用于费用交换。
- 保留障碍物部署和撤换顺序，并将受凛御银灰回费影响的费用等待改为固定延时。
- 用户反馈突袭仍未通过后，加入自有塞雷娅：放在 `(8,4)`、朝上，使用2技能、自动治疗，安排在最终换箱完成后部署。
- 通过范围数据验证：塞雷娅2技能覆盖初雪 `(8,2)` 和凛御银灰 `(7,3)`，不覆盖结城理 `(10,2)`；静态断言 `heals_makoto: false` 通过。
- 最终文件为 `data/copilot-104914/TW-EX-7-silverash-robot.json`；静态校验、路线可达性、部署格、技能配置和范围检查通过，仍未实战验证。

Failures and how to do differently:

- 第一版加入凛御银灰和 Lancet-2 后用户明确反馈“过不了突袭”，因此该方案不能视为成功；后续修改应保留“上一版失败、当前只是待实测补强”的状态。
- 地图坐标转换容易出错：MAA 地图数组已按自上而下排列，但路线实体的原始 `row` 需要转换为 `y = height - 1 - row`；不要把地图数组再次翻转。
- 结城理/塞雷娅范围必须按 `range_table.json` 计算，而不是只根据朝向判断。

Reusable knowledge:

- TW-EX-7 突袭条件包括敌人攻击与生命提升至 1.2 倍、我方防御降至 30%；部署上限为 8。
- 凛御银灰三技能专三初始技力 46、消耗 55；其技能会改变待部署区费用排序并产生回费/费用交换，因此新增技能后不能机械保留原 `cost_changes` 等待条件。
- 塞雷娅当前快照中2技能为7级、3技能未专精；本适配使用2技能，不能误写成2技能专三。
- MAA 作业中“好了就用”应通过干员 `skill_usage: 1` 或 `SkillUsage` 动作实现；首次需要特殊时序时可先 `skill_usage: 0`，显式开一次后再切换为1。

References:

- `data/copilot-104914/TW-EX-7-silverash-robot.json`
- `data/copilot-104914/build_adapted.py`
- `data/copilot-104914/README.md`
- `data/copilot-104914/validation.json`
- 关键最终配置：塞雷娅 `skill: 2`，部署 `[8,4]`，方向 `Up`；`heals_initial_snow: true`、`heals_silverash: true`、`heals_makoto: false`
- 用户原话：`注意塞雷娅不要奶到结城理`

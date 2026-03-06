# Fulcrum-Notes-Typst

## 文档

Fulcrum-Template-Typst 包提供的函数信息参见对应的 `README.md` 文档。

## 书写规范：

0. 0级：未分块自然语言，尽量避免。

1. 1级：分块但未分类自然语言
    
    包括各种定理直觉、定义动机、术语别名、语言符号习惯，应包裹在“注”环境块中。

2. 2级：分类自然语言
    
    即能明确归为“定义”、“定理”等类别的条目，但不想按 Lean 伪代码语法书写，用对应的“XX块”环境块包裹。该格式下只需指定中（英）文标题和条目内容即可。

3. 3级：带索引自然语言

    在条目前对本次声明的术语用 `#let` 关键词和 `#optionLink` 函数声明一个带索引常量，`url` 参数可以留空。

    定义一个 `#let <Name>Style = body => { ... body}` 函数，内容是：

    对于已有自带符号，且该符号语义定向性强、适宜重载的（比如交集 $\cap$ 并集 $\cup$ 之类的符号），在函数体的 `body` 之前通过 `#show` 命令改变其默认展示模式。
    
    条目内容中术语采用对应的常量表达。对于自带符号，用 `#show : <Name>Style` 来改变相关符号的默认展示模式。 
    
    在每次 commit 之前应通过 copilot 或手动将所有常量声明和 `#show` 命令放入 `main.typ` 同目录下的 `export.typ` 文件中，以规避循环导入问题。

    随手写的让 copilot 搬东西的 prompt：

    ```
    Please move all following codes:
    1. constant declarations, with format `#let <varName> = optionLink( ... )`;
    2. `#show` commands, with format `#show math.<opName> : optionLink( ... )`;
    from `main.typ` to `export.typ` (the one which shares the same directory with `main.typ`), following these rules: 
    1. For each constant declaration, make sure it is placed in the global scope, and in the same order as the corresponding entries in `main.typ`. 
    2. For each `#show` command, make sure it is placed inside `#let <Name>Style = body => { ... body}` function body before `body`, and in the same order as the corresponding entries in `main.typ`.
    ```

4. 4级：严格按照 Lean 伪代码语法书写的条目

    使用对应环境包裹，比较麻烦，如果觉得累可以不这么做。

二级是及格线，三级是推荐标准，四级现阶段难以达到，仅作为一种 CNL 语言测试，未来我们尝试通过重写 Lean Pretty Print 来实现自动化的 CNL 生成。

## 附录：数学学科分类标准（MSC）

来自维基百科：

https://zh.wikipedia.org/wiki/%E6%95%B0%E5%AD%A6%E5%AD%A6%E7%A7%91%E5%88%86%E7%B1%BB%E6%A0%87%E5%87%86

### 通用/数学基础
- 00: 总论
- 01: 数学史与文献
- 03: 数理逻辑与数学基础

### 离散数学/代数学
- 05: 组合学
- 06: 序理论/格论/序代数结构
- 08: 一般代数系统
- 11: 数论
- 12: 域论与多项式
- 13: 交换代数
- 14: 代数几何
- 15: 线性代数与多线性代数/矩阵论
- 16: 结合环与结合代数
- 17: 非结合环与非结合代数
- 18: 范畴论/同调代数
- 19: K-理论
- 20: 群论及其推广
- 22: 拓扑群/李群

### 分析学
- 26: 实变函数
- 28: 测度与积分
- 30: 复变函数
- 31: 位势论
- 32: 多复变函数与解析空间
- 33: 特殊函数论
- 34: 常微分方程
- 35: 偏微分方程
- 37: 动力系统与遍历论
- 39: 差分方程与函数方程
- 40: 序列/级数/发散级数（求和法）
- 41: 逼近论与级数展开
- 42: 欧氏空间上的调和分析（傅里叶分析）
- 43: 抽象调和分析
- 44: 积分变换/算子演算
- 45: 积分方程
- 46: 泛函分析
- 47: 算子理论
- 49: 变分法与最优控制/最优化

### 几何学/拓扑学
- 51: 几何学
- 52: 凸几何与离散几何
- 53: 微分几何
- 54: 一般拓扑学
- 55: 代数拓扑
- 57: 流形与胞腔复形
- 58: 大范围分析与流形上的分析

### 应用数学/其他
- 60: 概率论与随机过程
- 62: 统计学
- 65: 数值分析
- 68: 计算机科学
- 70: 质点力学与系统力学
- 74: (可变形)固体力学
- 76: 流体力学
- 78: 光学/电磁学
- 80: 经典热力学, 热传导
- 81: 量子理论
- 82: 统计力学/物质结构
- 83: 相对论与引力理论
- 85: 天文学与天体物理学
- 86: 地球物理
- 90: 运筹学/数学规划
- 91: 博弈论/数理经济学/数理社会学/数理行为科学
- 92: 生物学与其他自然科学
- 93: 系统论/控制论
- 94: 信息与通信/电路
- 97: 数学教育
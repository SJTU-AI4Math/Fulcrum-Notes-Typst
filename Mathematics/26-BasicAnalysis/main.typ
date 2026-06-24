// Mathematics/26-BasicAnalysis/main.typ
//
// 微积分基础 (BasicAnalysis) — 函数 / 极限 / 导数 / 积分 / 卷积 / ...
//
// 当前内容: 仅 = 卷积 章 (最小骨架, 2026-06-24, 为 34-ODE Duhamel 公式提供前置)
// 其它章 (函数/导数/积分等) 待续。
//
// 写作铁律: 见 skill fulcrum-notes-typst "CNL 写作五铁律 + 章节铁律"
// API 风格: 新 API (#定义条目 / #定理条目 + *子句)

#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* contributors */
#import "../contributors.typ": *

/* type theory (Set / 谓词式记号等) */
#import "../03-TypeTheory/export.typ": *

#show: FulcrumCN

#title([微积分基础])

#outline(title: "目录", indent: 2em)

#pagebreak()

// ============================================================
= 卷积
// ============================================================

#约定[
  - $bold(f), bold(g) : bb(R) -> bb(C)^n$
  - $I subset.eq bb(R)$ 是区间
]

#定义条目(
  "卷积",
  "Convolution",
  uuid: "Convolution",
  contributors: (猫猫,),
)[
  #定义子句(
    主体: [$bold(f)$ 与 $bold(g)$ 的*卷积* $bold(f) #conv bold(g)$],
    内容: [$bb(R) -> bb(C)^n$ 函数 $(bold(f) #conv bold(g))(t) := integral_(-infinity)^(+infinity) bold(f)(t - s) bold(g)(s) dif s$, 在右端积分存在的意义下 (依赖于 $bold(f), bold(g)$ 的可积性).],
    记号: $bold(f) #conv bold(g)$,
  )
]

#注[
  在 ODE 的因果初值问题语境下, 常用*单侧卷积*: 若 $bold(f), bold(g)$ 在 $[t_0, +infinity)$ 上有意义且 $bold(g)$ 在 $(-infinity, t_0)$ 上取零, 则
  $ (bold(f) #conv bold(g))(t) = integral_(t_0)^(t) bold(f)(t - s) bold(g)(s) dif s. $
  本节定义采用 $bb(R)$ 上的双侧形式; 在 34-OrdinaryDifferentialEquation 章里把 *矩阵指数* 与外源项作卷积时, 默认取上述单侧约定.
]

#注[
  // TODO 后续可补:
  //   - 卷积的代数性质 (交换律 / 结合律 / 分配律) — 需 Fubini, 待 28-MeasureTheory
  //   - 卷积与微分的关系: (f * g)' = f' * g = f * g' (在适当光滑条件下)
  //   - 紧支撑 / Schwartz 类 / L^p 上的卷积
  //   - Young 不等式 ‖f * g‖_r ≤ ‖f‖_p ‖g‖_q (1/p + 1/q = 1 + 1/r)
  //   - 卷积与 Fourier 变换: F(f*g) = F(f) F(g)
]

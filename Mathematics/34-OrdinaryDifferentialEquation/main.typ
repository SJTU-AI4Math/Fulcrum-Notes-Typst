/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* set theory */
#import "../54-Topology/export.typ": *

#show: FulcrumCN

// #hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2em)[常微分方程])
]

#align(center)[
  #block(text(weight: "bold", size: 1em)[Ordinary Differential Equations])
]

#outline(title: "Contents", indent: 2em)

#pagebreak()

= 常微分方程的初等方法

== 基本概念

#定义(
  uuid: "ImplicitODE",
  "常微分方程的一般形式 / 隐式常微分方程",
  "the General Form of ODE / Implicit ODE",
  hypotheses: ([$x: bb(R)$, $y(x): bb(R) arrow bb(R)$], [$F: bb(R)^(n+2) arrow bb(R)$]),
  [常微分方程的一般形式 / 隐式常微分方程],
)[
  $ F(x,y,y',y'',dots,y^((n)))=0 $
]

#注[
  之所以给微分方程冠以“常”字，是因为我们研究的函数是一元的。如果是多元函数，就会出现偏导数。这时我们称之为偏微分方程.
]

#定义(
  uuid: "ODEOrder",
  "常微分方程的阶",
  "the Order of ODE",
  hypotheses: ([$ star: F(x,y,y',y'',dots,y^((n)))=0 $ 是一个常微分方程],),
  [常微分方程 $star$ 的阶],
)[
  $n$
]

#定义(
  uuid: "LinearODE",
  "线性常微分方程",
  "Linear ODE",
  isPredicate: true,
  hypotheses: ([$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],),
  [$star$ 是线性常微分方程],
)[
  $F$ 关于 $y,y',y'',dots,y^((n))$ 是线性的. 即:
  $ F(x,y,y',y'',dots,y^((n)))=a_(n)(x)y^((n))+a_(n-1)(x)y^((n-1))+dots+a_1(x)y'+a_0(x)y+g(x) $
]

#定义(
  uuid: "AutonomousODE",
  "自治常微分方程",
  "Autonomous ODE",
  isPredicate: true,
  hypotheses: ([$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],),
  [$star$ 是自治常微分方程],
)[
  $F$ 不显含 $x$. 即 $F(y,y',y'',dots,y^((n)))=0$.
]

#定义(
  uuid: "ODESolution",
  "常微分方程的解",
  "Solution to the ODE",
  isPredicate: true,
  hypotheses: (
    [$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],
    [$D subset.eq bb(R)$],
    [$phi.alt: Cont(D, bb(R))$],
  ),
  [$phi.alt$ 是常微分方程 $star$ 的解],
)[
  $ forall x in D, F(x, phi.alt(x), phi.alt'(x), phi.alt''(x), dots, phi.alt^((n))(x)) = 0 $
]

#定义(
  uuid: "GeneralSolution",
  "通解",
  "General Solution",
  isPredicate: true,
  hypotheses: (
    [$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],
    [$D subset.eq bb(R)$],
    [$f: Cont(D times bb(R)^n, bb(R))$],
  ),
  [$f$ 是常微分方程 $star$ 的通解],
)[
  如果对于 $D$ 上的任意解 $phi.alt$, 都存在 $(C_1,C_2,dots,C_n) in bb(R)$, 使得对于 $D$ 上的任意 $x$, 都有
  $ phi.alt(x) = f(x, C_1, C_2, dots, C_n) $
  其中 $C_1, C_2, dots, C_n$ 是独立的任意常数, 满足
  $ det frac(partial(y, y', dots, y^((n-1))), partial(C_1, C_2, dots, C_n))eq.not 0 $
]

#注[
  在任意常数 $C_1, C_2, dots, C_n$ 的确定下来时, $f$ 就是 $star$ 的一个特解.
]

#定义(
  uuid: "SingularSolution",
  "奇解",
  "Singular Solution",
  isPredicate: true,
  hypotheses: (
    [$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],
    [$phi.alt$ 是 $star$ 的一个解],
    [$f$ 是 $star$ 的一个通解],
  ),
  [$phi.alt$ 是常微分方程 $star$ 的一个奇解],
)[
  $exists.not (C_1, C_2, dots, C_n) in bb(R)^n$, $phi.alt (x) = f(x, C_1, C_2, dots, C_n)$
]

#注[
  通解不一定包含了所有的解. 奇解就是那些不包含在通解中的解.
]

#定义(
  uuid: "CauchyInitialCondition",
  "Cauchy 初值条件",
  "Cauchy Initial Condition",
  hypotheses: (
    [$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],
    [$x_0: bb(R)$],
    [$y_0, y_1, dots, y_(n-1): bb(R)$],
  ),
  [Cauchy 初值条件],
)[
  一列等式 $y(x_0)=y_0, y'(x_0)=y_1, dots, y^((n-1))(x_0)=y_(n-1)$
]

#定义(
  uuid: "SturmLiouvilleBoundaryCondition",
  "Sturm-Liouville 边界条件",
  "Sturm-Liouville Boundary Condition",
  hypotheses: (
    [$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],
    [$a: bb(R), b: bb(R)$],
    [$y_0, y_1, dots, y_(n-1): bb(R)$],
  ),
  [Sturm-Liouville 边界条件],
)[
  一列等式 $y(a)=y_0, y(b)=y_1, dots, y^((n-1))(a)=y_(n-1)$
]

#注[
  Cauchy 初值条件与 Sturm-Liouville 边界条件可以用来求解所有的待定常数 $C_1,dots,C_n$.
]

#注[
  微分方程有三个基本问题:
  1. 解的存在性;
  2. 解的唯一性;
  3. 解集合的结构.
]

#定义(
  uuid: "ExplicitODE",
  "显式常微分方程 / 常微分方程的标准形式",
  "Explicit ODE / Standard Form of ODE",
  hypotheses: ([$x: bb(R)$, $y(x): bb(R) arrow bb(R)$], [$f: bb(R)^(n+1) arrow bb(R)$]),
  [显式常微分方程 / 常微分方程的标准形式],
)[
  $ y^((n)) = f(x, y, y', y'', dots, y^((n-1))) $
]

#定义(
  uuid: "PhaseSpace",
  "相空间",
  "Phase Space",
  hypotheses: ([$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程], [$y(x): bb(R) arrow bb(R)$]),
  [常微分方程 $star$ 的相空间],
)[
  $bb(R)^(n)$, 其中每个点 $(y,y',dots,y^((n-1)))$ 都对应着 $star$ 的一个解 $y(x)$ 在 $x$ 处的函数值和各阶导数值.
]

#定义(
  uuid: "AugmentedPhaseSpace",
  "增广相空间",
  "Augmented Phase Space",
  hypotheses: ([$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程], [$y(x): bb(R) arrow bb(R)$]),
  [常微分方程 $star$ 的增广相空间],
)[
  $bb(R)^(n+1)$, 其各分量为 $(x,y,y',dots,y^((n-1)))$.
]

#定义(
  uuid: "IntegralCurve",
  "积分曲线",
  "Integral Curve",
  hypotheses: ([$star: F(x,y,y',y'',dots,y^((n)))=0$ 是一个常微分方程],),
  [常微分方程 $star$ 的积分曲线],
)[
  $star$ 的一个解 $y(x)$ 在增广相空间中的曲线.
]

#注[
  微分方程的解 $phi.alt$ 就是增广相空间中的一族积分曲线.
]

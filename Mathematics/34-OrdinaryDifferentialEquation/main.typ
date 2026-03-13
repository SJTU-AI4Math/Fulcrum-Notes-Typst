/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* topology */
#import "../54-Topology/export.typ": *

/* differential theory */
#import "../26-BasicAnalysis/export.typ": *

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

== 初等积分法

#定义(
  uuid: "ExactODE",
  "恰当方程 / 正合方程 / 全微分方程",
  "Exact ODE / Perfect ODE / Total Differential Equation",
  isPredicate: true,
  hypotheses: (
    [$P: bb(R)^2 arrow bb(R)$],
    [$Q: bb(R)^2 arrow bb(R)$],
    [$ star: P(x,y) dif x +Q(x,y) dif y=0 $ 是一个常微分方程],
  ),
  [$star$ 是恰当方程 / 正合方程 / 全微分方程],
)[
  $ exists Phi: bb(R)^2 arrow bb(R), dif Phi (x,y) = P(x,y) dif x +Q(x,y) dif y $
  即
  $ pdv(Phi, x) = P(x,y) , pdv(Phi, y) = Q(x,y) $
]

#定理(
  uuid: "ExactODECriterion",
  "恰当方程的充要条件",
  "Criterion for Exact ODE",
  hypotheses: (
    [$P: bb(R)^2 arrow bb(R)$],
    [$Q: bb(R)^2 arrow bb(R)$],
    [$R subset.eq bb(R)^2$],
    [$ star: P(x,y) dif x +Q(x,y) dif y=0 $ 是一个一阶常微分方程],
    [P, Q 在 $R$ 上具有连续的一阶偏导数],
  ),
)[
  $star$ 是恰当方程的充要条件是
  $ pdv(P, y) = pdv(Q, x) $
  在 $R$ 上恒成立.
  #linebreak()
  则此时 $star$ 的通解为求取 $(x_0,y_0) in R$ 到 $(x,y)$ 的曲线积分:
  $ integral_(x_0)^x P(x,y) dif x + integral_(y_0)^y Q(x_0, y) dif y =C $
  或者
  $ integral_(x_0)^x P(x,y_0) dif x + integral_(y_0)^y Q(x, y) dif y =C $
]

#定义(
  uuid: "IntegratingFactor",
  "积分因子",
  "Integrating Factor",
  isPredicate: true,
  hypotheses: (
    [$P: bb(R)^2 arrow bb(R)$],
    [$Q: bb(R)^2 arrow bb(R)$],
    [$ star: P(x,y) dif x +Q(x,y) dif y=0 $ 是一个常微分方程],
    [$mu: bb(R)^2 arrow bb(R)$],
  ),
  [$mu$ 是 $star$ 的一个积分因子],
)[
  $ mu(x, y) (P(x,y) dif x +Q(x,y) dif y) $ 是一个恰当方程.
]

#定义(
  uuid: "SeparableODE",
  "可分离变量的常微分方程",
  "Separable ODE",
  isPredicate: true,
  hypotheses: (
    [$P: bb(R)^2 arrow bb(R)$],
    [$Q: bb(R)^2 arrow bb(R)$],
    [$ star: P(x,y) dif x +Q(x,y) dif y=0 $ 是一个一阶常微分方程],
  ),
  [$star$ 是可分离变量的常微分方程],
)[
  $exists M_1(x), M_2(x), N_1(y), N_2(y)$ 满足 $P(x,y) = M_1(x)N_1(y)$, $Q(x,y) = M_2(x)N_2(y)$
]

#定理(
  uuid: "SeparableODESolution",
  "可分离变量的常微分方程的解法",
  "Solution to Separable ODE",
  hypotheses: (
    [$P: bb(R)^2 arrow bb(R)$],
    [$Q: bb(R)^2 arrow bb(R)$],
    [$ star: P(x,y) dif x +Q(x,y) dif y=0 $ 是一个一阶常微分方程],
    [$star$ 是可分离变量的常微分方程],
  ),
)[
  $star$ 的通积分为
  $ integral frac(M_1(x), M_2(x)) dif x + integral frac(N_2(y), N_1(y)) dif y = C $
  其中 $M_1(x), M_2(x), N_1(y), N_2(y)$ 满足 $P(x,y) = M_1(x)N_1(y)$, $Q(x,y) = M_2(x)N_2(y)$.
]

#定义(
  uuid: "FirstorderLinearODE",
  "一阶线性微分方程",
  "First-order Linear ODE",
  isPredicate: true,
  hypotheses: ([$star$ 是常微分方程],),
  [$star$ 是一阶线性微分方程],
)[
  $star$ 可以写成如下形式:
  $ y' + P(x)y = Q(x) $
  其中 $P(x), Q(x): bb(R) arrow bb(R)$.
]

#定义(
  uuid: "FirstorderLinearHomogeneousODE",
  "一阶线性齐次微分方程",
  "First-order Linear Homogeneous ODE",
  isPredicate: true,
  hypotheses: ([$star: y' + P(x)y = Q(x)$ 是一阶线性微分方程],),
  [$star$ 是一阶线性齐次微分方程],
)[
  $Q(x)=0$ 恒成立.
]

#定理(
  uuid: "FirstorderLinearHomogeneousODESolution",
  "一阶线性齐次微分方程的解法",
  "Solution to First-order Linear Homogeneous ODE",
  hypotheses: ([$star: y' + P(x)y = Q(x)$ 是一阶线性微分方程],),
)[
  $star$ 的通积分为
  $ y = C exp(- integral P(x) dif x) $
  其中 $C$ 是任意常数.
]

#注[
  对于一阶线性齐次方程, 我们使用分离变量法来求解即可.
]

#定理(
  uuid: "FirstorderLinearNonhomogeneousODESolution",
  "一阶线性非齐次微分方程的解法",
  "Solution to First-order Linear Nonhomogeneous ODE",
  hypotheses: ([$star: y' + P(x)y = Q(x)$ 是一阶线性微分方程],),
)[
  $star$ 的通积分为
  $ y = C exp(- integral P(x) dif x) + exp(- integral P(x) dif x) integral exp(integral P(x) dif x) Q(x) dif x $
  其中 $C$ 是任意常数.
  #linebreak()
  为了确定起见, 有时将它写成变上限的定积分:
  $ y=C exp(-integral_(x_0)^x P(t) dif t)+integral_(x_0)^x Q(s) exp(-integral_s^x P(t)dif t)dif s $
]

#性质(
  "一阶线性微分方程的积分因子",
  "Integrating Factor for First-order Linear ODE",
  hypotheses: ([$star: y' + P(x)y = Q(x)$ 是一阶线性微分方程],),
)[
  $ exp(integral P(x) dif x) $ 是 $star$ 的一个积分因子.
]

#注[
  这俩求解一阶线性非齐次微分方程使用积分因子法. 先求出对应的一阶线性齐次微分方程的通解, 再使用积分因子将非齐次方程转化为齐次方程来求解.
]

#性质(
  uuid: "LinearityOfFirstorderLinearHomogeneousODESolution",
  "一阶线性齐次微分方程解的线性性质",
  "Linearity of Solution to First-order Linear Homogeneous ODE",
  hypotheses: ([$star: y' + P(x)y = 0$ 是一阶线性齐次微分方程], [$y_1, y_2: star$], [$alpha,beta : bb(R)$]),
)[
  $alpha y_1 + beta y_2: star$.
]

#性质(
  uuid: "LinearityOfFirstorderLinearNonhomogeneousODESolution",
  "一阶线性非齐次微分方程解的线性性质",
  "Linearity of Solution to First-order Linear Nonhomogeneous ODE",
  hypotheses: (
    [$star: y' + P(x)y = Q(x)$ 是一阶线性非齐次微分方程],
    [$ast: y' + P(x)y = 0$ 是一阶线性齐次微分方程],
    [$y_1, y_2: star$],
    [$y_0: ast$],
    [$alpha,beta : bb(R)$],
  ),
)[
  1. $y_1-y_2: ast$;
  2. $y_1+alpha y_0: star$,
  3. $alpha+beta=1$ iff $alpha y_1 + beta y_2: star$.
]


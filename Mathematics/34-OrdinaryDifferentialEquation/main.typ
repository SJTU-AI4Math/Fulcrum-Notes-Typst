/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* topology */
#import "../54-Topology/export.typ": *

/* differential theory */
#import "../26-BasicAnalysis/export.typ": *

/* linear algebra (特征值理论 / Jordan 标准型 术语化) */
#import "../15-LinearAlgebra/export.typ": *

/* type theory (structProp 等) */
#import "../03-TypeTheory/export.typ": *

/* contributors */
#import "../contributors.typ": *

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
  [$star$ 是#FLODE],
)[
  $star$ 可以写成如下形式:
  $ y' + p(x)y = q(x) $
  其中 $p(x), q(x): bb(R) arrow bb(R)$.
]

#定义(
  uuid: "FirstorderLinearHomogeneousODE",
  "一阶线性齐次微分方程",
  "First-order Linear Homogeneous ODE",
  isPredicate: true,
  hypotheses: ([$star: y' + p(x)y = q(x)$ 是#FLODE],),
  [$star$ 是一阶线性齐次微分方程],
)[
  $q(x)=0$ 恒成立.
]

#定理(
  uuid: "FirstorderLinearHomogeneousODESolution",
  "一阶线性齐次微分方程的解法",
  "Solution to First-order Linear Homogeneous ODE",
  hypotheses: ([$star: y' + p(x)y = q(x)$ 是#FLODE],),
)[
  $star$ 的通积分为
  $ y = C exp(- integral p(x) dif x) $
  其中 $C$ 是任意常数.
]

#注[
  对于一阶线性齐次方程, 我们使用分离变量法来求解即可.
]

#定理(
  uuid: "FirstorderLinearNonhomogeneousODESolution",
  "一阶线性非齐次微分方程的解法",
  "Solution to First-order Linear Nonhomogeneous ODE",
  hypotheses: ([$star: y' + p(x)y = q(x)$ 是#FLODE],),
)[
  $star$ 的通积分为
  $ y = C exp(- integral p(x) dif x) + exp(- integral p(x) dif x) integral exp(integral p(x) dif x) q(x) dif x $
  其中 $C$ 是任意常数.
  #linebreak()
  为了确定起见, 有时将它写成变上限的定积分:
  $ y=C exp(-integral_(x_0)^x p(t) dif t)+integral_(x_0)^x q(s) exp(-integral_s^x p(t)dif t)dif s $
]

#性质(
  uuid: "IntegratingFactorForFirstorderLinearODE",
  "一阶线性微分方程的积分因子",
  "Integrating Factor for First-order Linear ODE",
  hypotheses: ([$star: y' + p(x)y = q(x)$ 是#FLODE],),
)[
  $ exp(integral p(x) dif x) $ 是 $star$ 的一个积分因子.
]

#注[
  这俩求解一阶线性非齐次微分方程使用积分因子法. 先求出对应的一阶线性齐次微分方程的通解, 再使用积分因子将非齐次方程转化为齐次方程来求解.
]

#性质(
  uuid: "LinearityOfFirstorderLinearHomogeneousODESolution",
  "一阶线性齐次微分方程解的线性性质",
  "Linearity of Solution to First-order Linear Homogeneous ODE",
  hypotheses: ([$star: y' + p(x)y = 0$ 是一阶线性齐次微分方程], [$y_1, y_2: star$], [$alpha,beta : bb(R)$]),
)[
  $alpha y_1 + beta y_2: star$.
]

#性质(
  uuid: "LinearityOfFirstorderLinearNonhomogeneousODESolution",
  "一阶线性非齐次微分方程解的线性性质",
  "Linearity of Solution to First-order Linear Nonhomogeneous ODE",
  hypotheses: (
    [$star: y' + p(x)y = q(x)$ 是一阶线性非齐次微分方程],
    [$ast: y' + p(x)y = 0$ 是一阶线性齐次微分方程],
    [$y_1, y_2: star$],
    [$y_0: ast$],
    [$alpha,beta : bb(R)$],
  ),
)[
  1. $y_1-y_2: ast$;
  2. $y_1+alpha y_0: star$,
  3. $alpha+beta=1$ iff $alpha y_1 + beta y_2: star$.
]

#性质(
  "#FLODE的解的唯一性",
  "Uniqueness of Solution to First-order Linear ODE",
  hypotheses: ([$star: y' + p(x)y = q(x)$ 是#FLODE], [$x_0: bb(R)$], [$y_0: bb(R)$]),
)[
  $star$ 满足 Cauchy 初值条件 $y(x_0)=y_0$ 的解是唯一的.
]

#性质(
  "一阶线性微分方程的解与0的关系",
  "",
  hypotheses: ([$star: y' + p(x)y = q(x)$ 是#FLODE],),
)[
  1. 如果 $q(x)=0$ 恒成立, 则 $y=0$ 是 $star$ 的一个解;
  2. 如果 $q(x) eq.not 0$ 恒成立, 则 $y=0$ 一定不是 $star$ 的一个解.
]

== 一阶线性微分方程的几种变体

#定义(
  uuid: "ScalefreeODE",
  "比值微分方程 / 齐次微分方程 / 无量纲微分方程",
  "",
  isPredicate: true,
  hypotheses: (
    [$P: bb(R)^2 arrow bb(R)$],
    [$Q: bb(R)^2 arrow bb(R)$],
    [$ star: P(x,y) dif x +Q(x,y) dif y=0 $ 是一个一阶常微分方程],
  ),
  [$star$ 是比值微分方程 / 齐次微分方程 / 无量纲微分方程],
)[
  $P(x,y), Q(x,y)$ 都是 $x,y$ 的同次齐次函数.
  $ forall t in bb(R), P(t x, t y) = t^n P(x,y), Q(t x, t y) = t^n Q(x,y) $
  其中 $n: bb(N)$.
]

#注[
  这里的“齐次”指的是解函数的齐次性, 而不是微分方程作为等式本身的齐次性. 为了表示区别, 我们用 "Scale-free" 来表示解的齐次性, 用 "Homogeneous" 来表示微分方程的齐次性.
]

#性质(
  "比值微分方程的等价定义",
  "Equivalent Definition for Scalefree ODE",
  hypotheses: ([$star$ 是一个一阶常微分方程],),
  cstyle: "display",
)[
  $star$ 是比值微分方程的充要条件是
  $ exists f: bb(R) arrow bb(R), star: dv(y, x) = f(frac(y, x)) $
]

#定理(
  "比值微分方程的换元解法",
  "",
  hypotheses: ([$star$ 是比值微分方程],),
)[
  令 $z=frac(y, x)$, 则
  $ star: dv(y, x) = f(frac(y, x)) arrow.l.r.long.double star: x dv(z, x) = f(z)- z $
  这是一个#SepODE.
]

#定理(
  "比值微分方程的积分因子",
  "Integrating Factor for Scalefree ODE",
  hypotheses: ([$star: P(x,y) dif x +Q(x,y) dif y=0$ 是比值微分方程],),
)[
  $ frac(1, x P(x,y) + y Q(x,y)) $
  是 $star$ 的一个积分因子.
]

#例(
  "求解比值微分方程的实例",
  "",
)[
  求解微分方程
  $ dv(y, x) = frac(x+y, x-y) $
  换元, 令 $z=frac(y, x)$, 则原方程变为
  $ x dv(z, x) = frac(1+z, 1-z) - z $
  分离变量, 得到
  $ integral frac(1-z, 1+z^2) dif z = integral frac(dif x, x) $
  由此积分, 可得
  $ ln |x| = frac(ln |1+z^2|, 2) - arctan z +C $
  将 $z$ 换回 $y$ 和 $x$, 可得
  $ ln |x| = frac(ln |x^2+y^2|, 2) - arctan frac(y, x) +C $
  指数化, 可得
  $ sqrt(x^2+y^2) = C exp arctan frac(y, x) $
]

#注[
  在极坐标下表示这个解, 就会得到
  $ r = C exp theta $
  这说明其积分曲线是一族以原点为极点的对数螺线.
]

#定义(
  uuid: "BernoulliODE",
  "Bernoulli 微分方程",
  "Bernoulli ODE",
  isPredicate: true,
  hypotheses: ([$star$ 是一个一阶常微分方程],),
  [$star$ 是 Bernoulli 微分方程],
)[
  $star$ :
  $ y' + p(x)y = q(x) y^n $
  其中 $p(x), q(x): bb(R) arrow bb(R)$, $n: bb(N)$, $n eq.not 0, 1$.
]

#定理(
  uuid: "BernoulliODESolution",
  "Bernoulli 微分方程的解法",
  "Solution to Bernoulli ODE",
  hypotheses: ([$star$ 是 Bernoulli 微分方程],),
)[
  令 $z=y^(1-n)$, 则
  $ star: y' + p(x)y = q(x) y^n arrow.l.r.long.double star: z' + (1-n)p(x)z = (1-n)q(x) $
  这是一个#FLODE.
]

#注[
  在 Bernoulli 微分方程两端同乘 $(1-n) y^(-n)$ 即可证明.
]

#定义(
  uuid: "RiccatiODE",
  "Riccati 微分方程",
  "Riccati ODE",
  isPredicate: true,
  hypotheses: ([$star$ 是一个一阶常微分方程],),
  [$star$ 是 Riccati 微分方程],
)[
  $star$ :
  $ dv(y, x) = a(x) y^2 + b(x) y + c(x) $
  其中 $a(x), b(x), c(x): bb(R) arrow bb(R)$, 且 $a (x)$ 不恒为零.
]

#性质(
  "Riccati 微分方程的特解可以求出通解",
  "",
  hypotheses: ([$star$ 是 Riccati 微分方程], [$y=phi (x)$ 是 $star$ 的一个特解]),
)[
  引入换元 $z=y-phi (x)$,
  则 $star$ 可以写成
  $ dv(z, x) = (b(x)+ 2c(x) phi (x))z+ a(x)z^2 $
  这是一个 #BernoulliODE.
]

#定理(
  "Riccati 微分方程的 Bernoulli-Liouville 定理",
  "Bernoulli-Liouville Theorem for Riccati ODE",
  hypotheses: ([$a eq.not 0$], [$b:bb(R)$], [$m:bb(R)$], [$star: dv(y, x) = a y^2 + c x^m$ 是 Riccati 微分方程]),
)[
  $star$ 可以使用初等积分法求解当且仅当
  $ m=0, -2, frac(-4k, 2k+1), frac(-4k, 2k-1) $
  其中 $k:NN^*$.
]

== 隐式一阶微分方程

#定义(
  uuid: "ImplicitFirstorderODE",
  "隐式一阶微分方程",
  "Implicit First-order ODE",
  isPredicate: true,
  hypotheses: ([$F: bb(R)^3 arrow bb(R)$],),
  [$F$ 是一个隐式一阶微分方程],
)[
  $F(x,y,y')=0$
]

#定理(
  "隐式一阶微分方程的显化",
  "Explicitization of Implicit First-order ODE",
  hypotheses: ([$F: bb(R)^3 arrow bb(R)$], [$star: F(x,y,y')=0$]),
)[
  设 $p:= dv(y, x)$. 若隐式一阶微分方程可以分离为 $y=f(x,p)$ 的形式, 则 $star$ 等价于
  $ (pdv(f, x) (x,p)-p) dif x + pdv(f, p) (x,p) dif p = 0 $
  这是一个显式的一阶微分方程.
]

#定义(
  uuid: "ClairautODE",
  "Clairaut 微分方程",
  "Clairaut ODE",
  isPredicate: true,
  hypotheses: ([$F: bb(R)^3 arrow bb(R)$], [$star: F(x,y,y')=0$]),
  [$star$ 是一个 Clairaut 微分方程],
)[
  $star$ 可以写成如下形式:
  $ y = x y' + g(y') $
  其中 $g: bb(R) arrow bb(R)$.
]

#定理(
  uuid: "ClairautODESolution",
  "Clairaut 微分方程的解法",
  "Solution to Clairaut ODE",
  hypotheses: ([$g: bb(R) arrow bb(R)$], [$star: y=x y'+g(y')$ 是 Clairaut 微分方程]),
)[
  $star$ 的通积分为
  $ y = C x + g(C) $
  其中 $C$ 是任意常数.
  #linebreak()
  $star$ 的奇解为
  $ y = x p + g(p) $
  其中 $p$ 满足 $x + g'(p) =0$.
]

#性质(
  "奇解是通解的包络线",
  "Singular Solution is the Envelope of General Solution",
  hypotheses: ([$g: bb(R) arrow bb(R)$], [$star: y=x y'+g(y')$ 是 Clairaut 微分方程]),
)[
  $star$ 的奇解是 $star$ 的通解的一族积分曲线的包络线.
]

/*
#定理(
  "隐式一阶微分方程的单参数法",
  "Single Parameter for Implicit First-order ODE",
  hypotheses: ([$F: bb(R)^3 arrow bb(R)$], [$star: F(x,y,y')=0$ 是一个隐式一阶微分方程],),
)[
  设 $p:= dv(y, x)$ 若 $star$ 可以分离为 $y=f(x,p)$ 的形式, 则 $star$ 的通积分为
]
*/

#定理(
  "隐式一阶微分方程的单参数法",
  "Single Parametrization for Implicit First-order ODE",
  hypotheses: ([$F: bb(R)^3 arrow bb(R)$], [$star: F(x,y,y')=0$ 是一个隐式一阶微分方程]),
)[
  若存在 $alpha, beta: bb(R) arrow bb(R)$ 满足 $star$ 可以分离为 $p=alpha (t), y=beta (t)$ 的形式, 则 $star$ 的通解为
  $ x= integral frac(beta ' (t), alpha (t)) dif t $
  $ y=beta (t) $
  特解为: 若 $exists t_0 in bb(R)$ 使得 $alpha (t_0) = 0$, 则 $y=beta (t_0)$ 是一个特解.
]

#定理(
  "隐式一阶微分方程的参数法",
  "Parametrization for Implicit First-order ODE",
  hypotheses: ([$F: bb(R)^3 arrow bb(R)$], [$star: F(x,y,y')=0$ 是一个隐式一阶微分方程]),
)[
  若存在 $f,g,h$ 使得 $x=f(u,v), y=g(u,v), y'=h(u,v)$, 则 $star$ 可以写成
  $ (g_u-h f_u) dif u + (g_v-h f_v) dif v = 0 $
  这是一个显式的一阶微分方程. 其最终的解由参数 $u,v$ 给出.
]

#注[
  一般的参数法对于参数的选取有很高的要求. 如果没有什么观察, 很难选出合适的参数来将隐式方程转化为显式方程.
]

= 常微分方程的解的存在性与唯一性

== Picard-Lindelöf 定理

#定理(
  "Gronwall 不等式",
  "Gronwall's Inequality",
  hypotheses: (
    [$f: Cont([a,b], bb(R))$, $g: Cont([a,b], bb(R))$],
    [$g(x)>=0$],
    [$c: bb(R)$],
    [$f(x) <= c + integral_a^x g(t)f(t) dif t$],
  ),
)[
  $f(x) <= c exp integral_a^x g(t) dif t$
]

#注[
  证明思路如下: 令 $H(x) = c + integral_a^x g(t)f(t) dif t$, 则
  $ H'(x) = g(x)f(x) <= g(x) (c + integral_a^x g(t)f(t) dif t) = g(x) (c+ H(x)) $
  这就得到了一个一阶线性微分不等式
  $ H'(x) <= g(x) (c+ H(x)) $
  使用积分因子
  $ mu(x) = exp(- integral_a^x g(t) dif t) $
  即可.
]

#定理(
  "参数化的 Gronwall 不等式",
  "Parametrized Gronwall's Inequality",
  hypotheses: (
    [$f: Cont([a,b], bb(R))$, $g: Cont([a,b], bb(R))$],
    [$h: Cont([a,b], bb(R))$],
    [$g(x)>=0$],
    [$f(x) <= h(x) + integral_a^x g(t)f(t) dif t$],
  ),
)[
  $f(x) <= h(x) + exp integral_a^x g(s) dif s + integral_a^x g(t)h(t) exp (integral_t^x g(s) dif s) dif t$
]

#注[
  `tactic: "leftAsExercise"`
]

#定理(
  "一元 Picard-Lindelöf 定理 / 一元 Cauchy-Lipschitz 定理",
  "One-dimensional Picard-Lindelöf Theorem / One-dimensional Cauchy-Lipschitz Theorem",
  hypotheses: (
    [$star: dv(x, t)=f(t,x)$ 是常微分方程],
    [$t_0 : bb(R)$],
    [$x_0: bb(R)$],
    [$A: bb(R)$],
    [$M: bb(R)$],
    [$D: {(x,t) : |t-t_0|<=A, |x-x_0|<=M}$],
    [$f: Cont(D, bb(R))$],
    [
      $f$ 在 $D$ 上对 $x$ 满足 *Lipschitz 条件*. 即 $exists L: bb(R)$, 使得 $forall (x_1,t):D, (x_2,t):D$, 都有
      $ |f(t,x_1)-f(t,x_2)| <= L |x_1-x_2| $
    ],
    [$star$ 具有初值条件 $x(t_0)=x_0$],
  ),
)[
  $star$ 在区域 $|t-t_0|<=H$ 上存在唯一的解, 其中 $H=min {A, frac(M, max {|f(t,x)| : (x,t) in D})}$.
]

#定理(
  "Picard-Lindelöf 定理 / Cauchy-Lipschitz 定理",
  "Picard-Lindelöf Theorem / Cauchy-Lipschitz Theorem",
  hypotheses: (
    [$n: bb(N)^*$],
    [$star: dv(bold(x), t)=bold(f) (t,bold(x))$ 是常微分方程],
    [$t_0 : bb(R)$],
    [$bold(x)_0: bb(R)^n$],
    [$A: bb(R)$],
    [$B: bb(R)$],
    [$D: {(bold(x),t) : |t-t_0|<=A, ||bold(x)-bold(x)_0||<=B}$],
    [$f: Cont(D, bb(R))$],
    [$M: bb(R) = max_((t,x) in D) ||f(t, x)||$],
    [
      $f$ 在 $D$ 上对 $bold(x)$ 满足 *Lipschitz 条件*. 即 $exists L: bb(R)$, 使得 $forall ((bold(x))_1,t):D, (bold(x)_2,t):D$, 都有
      $ |f(t,bold(x)_1)-f(t,bold(x)_2)| <= L |bold(x)_1-bold(x)_2| $
    ],
    [$star$ 具有初值条件 $bold(x)(t_0)=bold(x)_0$],
  ),
)[
  $star$ 在区域 $|t-t_0|<=H$ 上存在唯一的解, 其中 $H=min {A, frac(B, M)}$.
]

#定理(
  "具有连续偏导数的常微分方程的解存在且唯一",
  "Existence and Uniqueness of Solution to ODE with Continuous Partial Derivatives",
  hypotheses: (
    [$n: bb(N)^*$],
    [$star: dv(bold(x), t)=bold(f) (t,bold(x))$ 是常微分方程],
    [$t_0 : bb(R)$],
    [$bold(x)_0: bb(R)^n$],
    [$A: bb(R)$],
    [$B: bb(R)$],
    [$D: {(bold(x),t) : |t-t_0|<=A, ||bold(x)-bold(x)_0||<=B}$],
    [$f: Cont(D, bb(R))$],
    [$M: bb(R) = max_((t,x) in D) ||f(t, x)||$],
    [
      $f$ 在 $D$ 上对 $bold(x)$ 具有连续偏导数,
    ],
    [$star$ 具有初值条件 $bold(x)(t_0)=bold(x)_0$],
  ),
)[
  $star$ 在区域 $|t-t_0|<=H$ 上存在唯一的解, 其中 $H=min {A, frac(B, M)}$.
]


#定义(
  "Picard 算子",
  "Picard Operator",
  hypotheses: ([$I subset.eq bb(R)$ 是闭区间], [$t_0 in I$], [$t in I$], [$bold(x)_0: bb(R)^n$]),
  [Picard 算子],
)[
  $ T: Cont(I, bb(R)^n) arrow Cont(I, bb(R)^n) $
  $ T(bold(x)) = bold(x)_0 + integral_(t_0)^t bold(f)(s, bold(x) (s)) dif s $
]
#定义(
  "Picard 序列",
  "Picard Sequence",
  isExtension: true,
  hypotheses: [$T$ 是 *Picard 算子*],
  [Picard 序列],
)[
  $ {bold(x)_0, T(bold(x)_0), T(T(bold(x)_0)), ...} $
  其中 $bold(x)_0$ 是常函数 $bold(x)_0 (t) = bold(x)_0$, $bold(x)_(n+1) = T(bold(x)_n)$.
]

#注[
  证明思路如下:
  #linebreak()
  先转化问题为求解积分方程
  $ bold(x)(t) = bold(x)_0 + integral_t_0^t bold(f)(s, bold(x) (s)) dif s $
  令常函数 $bold(x)_0 (t) = bold(x)_0$ 是一个可能解. 定义序列 ${bold(x)_0, bold(x)_1, bold(x)_2, ...}$ 是 Picard 序列. 注意到
  $
    ||bold(x)_1 - bold(x)_0 || = norm(integral_(t_0)^t bold(f)(s, bold(x)_0) dif s) <= max_((t,x) in D) ||f(t, x)|| dot |t-t_0| = M|t-t_0|
  $
  和
  $
    ||bold(x)_2 - bold(x)_1 || = norm(integral_(t_0)^t (bold(f)(s, bold(x)_1) - bold(f)(s, bold(x)_0)) dif s) <= L abs(integral_(t_0)^t norm(bold(x)_1 - bold(x)_0) dif s) <= frac(M L |t-t_0|^(2), 2!)
  $
  利用数学归纳法可以证明
  $ ||bold(x)_n - bold(x)_(n-1) || <= frac(M L^(n-1) |t-t_0|^(n), n!) $
  所以
  $
    bold(x)_n - bold(x)_0 = sum_(k=1)^n (bold(x)_k - bold(x)_(k-1)) <= sum_(k=1)^n frac(M L^(k-1) |t-t_0|^(k), k!) <= M |t-t_0| exp(L |t-t_0|)
  $
  根据 Weierstrass 判别法, Picard 序列在 $Cont(I, bb(R)^n)$ 上一致收敛. 代入迭代序列
  $ bold(x)_n = bold(x)_0 + integral_(t_0)^t bold(f) (s, bold(x)_(n-1) (s)) dif s $
  令 $n arrow infinity$: 由于一致收敛且 $f$ 连续, 可以交换极限和积分, 得到
  $ bold(x) = bold(x)_0 + integral_(t_0)^t bold(f) (s, bold(x) (s)) dif s $
  这说明 $bold(x)_n$ 确实一致收敛到积分方程的解. 这就证明了解的存在性.
  #linebreak()
  则根据 Banach 不动点定理, Picard 算子 $T$ 在 $Cont(I, bb(R)^n)$ 上存在唯一的不动点, 即 Picard 序列收敛于 $T$ 的唯一不动点. 又因为 $T$ 的不动点 $bold(x)$ 就是积分方程的解, 这就证明了解的唯一性.
]

#定理(
  "Picard 序列逼近误差估计",
  "Error Estimate for Picard Sequence Approximation",
  hypotheses: (
    [$n: bb(N)^*$],
    [$star: dv(bold(x), t)=bold(f) (t,bold(x))$ 是常微分方程],
    [$t_0 : bb(R)$],
    [$bold(x)_0: bb(R)^n$],
    [$A: bb(R)$],
    [$B: bb(R)$],
    [$D: {(bold(x),t) : |t-t_0|<=A, ||bold(x)-bold(x)_0||<=B}$],
    [${bold(x_n)}_(n=0)^infinity$ 是 $star$ 的 Picard 序列],
    [$bold(phi)$ 是 $star$ 的解],
    [$f$ 在 $D$ 上对 $bold(x)$ 满足 Lipschitz 条件, $L$ 是 Lipschitz 常数],
    [$M: bb(R) = max_((s,x) in D) ||f(s, x)||$],
  ),
)[
  $ ||bold(x)_n (t) - bold(phi) (t)|| <= frac(M L^n |t-t_0|^(n+1), (n+1)!) $
  其中 $bold(x)_0$ 是常函数 $bold(x)_0 (t) = bold(x)_0$.
]

#注[
  利用数学归纳法来证明: 对 $n=0$, 有
  $ ||bold(x)_0 (t) - bold(phi) (t)|| = norm(integral_(t_0)^t f(s, bold(phi)(s)) dif s) <= M |t-t_0| $
  成立. 再假设情况对 $n=m$ 成立:
  $ ||bold(x)_m (t) - bold(phi) (t)|| <= frac(M L^m |t-t_0|^(m+1), (m+1)!) $
  则对 $n=m+1$, 有
  $ ||bold(x)_(m+1) (t) - bold(phi) (t)|| = norm(integral_(t_0)^t (f(s, bold(x)_m (s)) - f(s, bold(phi)(s))) dif s) $
  $
    <= integral_(t_0)^t L ||bold(x)_m (s) - bold(phi)(s)|| dif s <= integral_(t_0)^t frac(M L^(m+1) |s-t_0|^(m+1), (m+1)!) dif s = frac(M L^(m+1) |t-t_0|^(m+2), (m+2)!)
  $
]

#例(
  "不满足 Lipschitz 条件的常微分方程的解可以不唯一",
  "",
)[
  常微分方程
  $ dv(x, t) = x^(1/3) $
  满足初值条件 $x(0)=0$ 的解不唯一. 例如, $x(t)=0$ 和
  $
    x(t) = cases(
      0 "  if" t <= 0,
      (frac(2, 3))^frac(3, 2) "  if" t>0
    )
  $
  都是这个初值问题的解.
]

#定理(
  "Osgood 定理",
  "Osgood's Theorem",
  hypotheses: (
    [$star: dv(x, t)=f(t,x)$ 是常微分方程],
    [$t_0 : bb(R)$],
    [$x_0: bb(R)$],
    [$D subset bb(R)^2$ 是一个区域, 且 $(x_0, t_0) in G$],
    [$star$ 具有初值条件 $x(t_0)=x_0$],
    [$f: Cont(D, bb(R))$],
    [$F: bb(R) arrow bb(R), forall (t,x_1):D, (t,x_2):D, |f(t,x_1)-f(t,x_2)| <= F(|x_1-x_2|)$],
    [$f$ 满足 Osgood 条件. 即:
      $ forall R in [0, +infinity], integral_0^R frac(1, F(s)) dif s = +infinity $
    ],
  ),
)[
  $star$ 在某个包含 $t_0$ 的区间上存在唯一的解.
]

#注[
  不满足 Lipschitz 条件的常微分方程也可能有唯一解. Osgood 条件是比 Lipschitz 条件更弱的一个条件, 但它仍然保证了常微分方程解的唯一性.
]

#例(
  "满足 Osgood 条件但不满足 Lipschitz 条件的常微分方程的解的唯一性",
  "",
)[
  常微分方程
  $ dv(x, t) = x ln |x| $
  满足初值条件 $x(0)=0$ 的解是唯一的. 这是因为 $f(t,x)=x ln |x|$ 满足 Osgood 条件, 但不满足 Lipschitz 条件.
]

// ============================================================
= 线性微分方程组
// ============================================================
//
// 章节结构 (猫猫 2026-06-24 拍板):
//   §1 常系数齐次线性微分方程组
//   §2 常系数非齐次线性微分方程组
//   §3 周期系数 ...... (TODO)
//
// 风格: 新 API (#定义条目 / #定理条目 + *子句)
// 写作铁律: 见 skill fulcrum-notes-typst "CNL 写作五铁律" (A 术语化/B 抠对象/C gibberish→#注/D 不嵌套/E 谓词式定义)
// Jordan 标准型 / 广义特征向量等术语由 15-LinearAlgebra/export.typ 提供 optionLink
// (LA 章对应 entry 暂未补; link 当前降级为纯文本不报错, 将来 entry 落地时自动生效)
//
// ============================================================

== 常系数齐次线性微分方程组

#约定[
  - $n : bb(N)^*$
  - $A : "Mat"_(n times n)(bb(C))$
  - $bold(x) : bb(R) -> bb(C)^n$
]

=== 方程的形式与解空间结构

#定义条目("常系数齐次线性微分方程组", "Constant-coefficient Homogeneous Linear System of ODEs", uuid: "ConstantCoefficientHomogeneousLinearSystem")[
  #定义子句(
    主体: [由 $A$ 决定的*常系数齐次线性微分方程组*],
    内容: [#一阶向量ODE $bold(f) : bb(R) times bb(C)^n -> bb(C)^n, quad bold(f)(t, bold(x)) := A bold(x)$],
    记号: $dv(bold(x), t) = A bold(x)$,
  )
]

#注[
  这是 #自治ODE: $bold(f)$ 不依赖 $t$.
]

#定理条目("常系数齐次线性方程组的解空间结构", "Solution Space of Constant-coefficient Homogeneous Linear System", uuid: "ConstantCoefficientHomogeneousSolutionSpace")[
  #定理子句(
    cstyle: "display",
    条件: ([$A in "Mat"_(n times n)(bb(C))$]),
    结论: [#常系数齐次线性方程组 $dv(bold(x), t) = A bold(x)$ 的解集 $cal(S)_A$ 是 $bb(C)$ 上的 $n$ 维线性空间, 且求值算子 $"ev"_0 : cal(S)_A -> bb(C)^n, bold(x) mapsto bold(x)(0)$ 是线性同构.],
  )
]

#注[
  $"ev"_0$ 单射来自解的唯一性 (Picard-Lindelöf 用到 $bold(f)(t,bold(x)) = A bold(x)$ 满足全局 Lipschitz), 满射来自解的存在性. 它们一起给出 $cal(S)_A tilde.equiv bb(C)^n$, 从而 $dim cal(S)_A = n$.
]

=== 由 Jordan 链构造基本解

本节先定义谓词 "*一组 $n$ 个解构成基本解*", 再构造性地给出两个实例: 单条 Jordan 链产生的解族 #JCS, 以及全体 Jordan 基产生的解组 #JBS, 证明它们都满足该谓词.

#定义条目("基本解", "Fundamental Solution Set", uuid: "FundamentalSolutionConstantCoefficient")[
  #定义子句(
    主体: [$(bold(phi)_1, dots, bold(phi)_n) in cal(S)_A^n$ 是一组*基本解*],
    isPredicate: true,
    内容: [$bold(phi)_1, dots, bold(phi)_n$ 在 $bb(C)$ 上线性无关],
  )
]

#注[
  由 #解空间结构定理 $dim cal(S)_A = n$, 故 "一组基本解" 等价于 "$cal(S)_A$ 的一组基". 任意解可唯一写成 $bold(x)(t) = sum_(i=1)^n c_i bold(phi)_i (t)$ 其中 $c_i in bb(C)$.
]

#定义条目(
  "Jordan 链产生的解族",
  "Jordan Chain Solutions",
  uuid: "JordanChainSolutions",
)[
  #定义子句(
    主体: [$lambda$ 在 #Jordan链 $bold(v) = (bold(v)_0, bold(v)_1, dots, bold(v)_(m-1))$ 上*产生的解族* $#JCS (lambda, bold(v))$],
    内容: [$bb(R) -> bb(C)^n$ 函数族 $(bold(phi)_0, bold(phi)_1, dots, bold(phi)_(m-1))$, 其中 $ bold(phi)_k (t) := e^(lambda t) sum_(j=0)^(k) t^j / j! bold(v)_(k-j) quad (0 <= k <= m-1) $],
    记号: $#JCS (lambda, bold(v))$,
  )
]

#注[
  展开看前几项:
  $
    bold(phi)_0 (t) &= e^(lambda t) bold(v)_0 \
    bold(phi)_1 (t) &= e^(lambda t) (t bold(v)_0 + bold(v)_1) \
    bold(phi)_2 (t) &= e^(lambda t) (t^2 / 2 bold(v)_0 + t bold(v)_1 + bold(v)_2)
  $
  长度 $m$ 的 Jordan 链给出 $m$ 个函数, $t$ 的最高次为 $m-1$.
]

#定理条目(
  "Jordan 链产生的解族都是解",
  "Jordan Chain Solutions Solve the System",
  uuid: "JordanChainSolutionsSolve",
)[
  #定理子句(
    cstyle: "display",
    条件: (
      [$lambda in bb(C)$],
      [$bold(v) = (bold(v)_0, dots, bold(v)_(m-1))$ 是 $A$ 在 $lambda$ 处的一条 #Jordan链],
    ),
    结论: [$#JCS (lambda, bold(v)) subset.eq cal(S)_A$ 且 $#JCS (lambda, bold(v))$ 在 $bb(C)$ 上线性无关.],
  )
]

#定义条目(
  "Jordan 基产生的解组",
  "Jordan Basis Solutions",
  uuid: "JordanBasisSolutions",
)[
  #定义子句(
    主体: [#Jordan基 $bold(B) = (bold(v)_(alpha, k))_(alpha, 0 <= k <= m_alpha - 1)$ *产生的解组* $#JBS (bold(B))$],
    内容: [将 #JCS 沿 $bold(B)$ 中所有 Jordan 链拼接而成的 $n$ 元函数组: $#JBS (bold(B)) := union.big_alpha #JCS (lambda_alpha, bold(v)_alpha)$],
    记号: $#JBS (bold(B))$,
    条件: (
      [$bold(B)$ 由 Jordan 链 $bold(v)_alpha = (bold(v)_(alpha, 0), dots, bold(v)_(alpha, m_alpha - 1))$ 组成, $alpha$ 遍历 Jordan 块索引, $sum_alpha m_alpha = n$, 每条链对应特征值 $lambda_alpha$],
    ),
  )
]

#定理条目(
  "Jordan 基产生的解组是基本解",
  "Jordan Basis Solutions Form a Fundamental Solution Set",
  uuid: "JordanBasisSolutionsAreFundamental",
)[
  #定理子句(
    cstyle: "display",
    条件: (
      [$A in "Mat"_(n times n)(bb(C))$],
      [$bold(B)$ 是 $A$ 在 $bb(C)^n$ 上的一组 #Jordan基],
    ),
    结论: [$#JBS (bold(B))$ 是一组 #常系数基本解.],
  )
]

#注[
  证明思路: 由 #Jordan链产生的解族都是解 知 $#JBS (bold(B)) subset.eq cal(S)_A$ 且每条链内部线性无关. 不同特征值的广义特征子空间在 $cal(S)_A$ 内对应的解族也直和 (因 $t -> infinity$ 时各 $e^(lambda_alpha t)$ 增长速率不同), 故全体 $n$ 个函数线性无关; 又 $dim cal(S)_A = n$, 它们恰好生成 $cal(S)_A$.
]

=== 基本解矩阵与齐次通解

为了写出 $cal(S)_A$ 的*显式参数化* (以及后续非齐次解的显式构造), 把一组 #常系数基本解 按列打包成矩阵值函数. 它的形式可逆性是后续 #变易系数法 的关键.

#定义条目(
  "基本解矩阵",
  "Fundamental Solution Matrix",
  uuid: "FundamentalSolutionMatrix",
)[
  #定义子句(
    主体: [由 #常系数基本解 $bold(phi) = (bold(phi)_1, dots, bold(phi)_n)$ 决定的*基本解矩阵* $#Phi基 _(bold(phi))$],
    内容: [
      $bb(R) -> "Mat"_(n times n)(bb(C))$ 函数 $(#Phi基 _(bold(phi)))(t) := mat(bold(phi)_1 (t), bold(phi)_2 (t), dots.c, bold(phi)_n (t))$, 即第 $i$ 列为 $bold(phi)_i (t)$.
    ],
    记号: $(#Phi基 _(bold(phi)))(t)$,
  )
]

#定理条目(
  "基本解矩阵的关键性质",
  "Key Properties of the Fundamental Solution Matrix",
  uuid: "FundamentalSolutionMatrixProperties",
)[
  #定理子句(
    cstyle: "display",
    条件: ([$bold(phi)$ 是 $dv(bold(x), t) = A bold(x)$ 的一组 #常系数基本解],),
    结论: [
      $#structProp(
        (name: [矩阵 ODE], value: [$forall t in bb(R), dv((#Phi基 _(bold(phi)))(t), t) = A (#Phi基 _(bold(phi)))(t)$]),
        (name: [处处可逆], value: [$forall t in bb(R), (#Phi基 _(bold(phi)))(t) in op("GL")_n (bb(C))$]),
      )$
    ],
  )
]

#注[
  "处处可逆" 来自 Liouville 公式: $det (#Phi基 _(bold(phi)))$ 满足 $dv(d, t) = ("tr" A) det$, 故 $det(#Phi基 _(bold(phi)))(t) = det(#Phi基 _(bold(phi)))(0) e^(("tr" A) t)$, 而 $det(#Phi基 _(bold(phi)))(0) eq.not 0$ 来自 $bold(phi)_i$ 线性无关.
]

#定理条目(
  "常系数齐次线性方程组的通解参数化",
  "General Solution of Homogeneous System via Fundamental Matrix",
  uuid: "HomogeneousGeneralSolutionViaPhi",
)[
  #定理子句(
    cstyle: "display",
    条件: ([$bold(phi)$ 是 $dv(bold(x), t) = A bold(x)$ 的一组 #常系数基本解],),
    结论: [
      映射 $bb(C)^n -> cal(S)_A, bold(c) mapsto (t mapsto (#Phi基 _(bold(phi)))(t) bold(c))$ 是线性同构. 即 $cal(S)_A$ 中任意解可唯一写成 $bold(x)(t) = (#Phi基 _(bold(phi)))(t) bold(c)$, $bold(c) in bb(C)^n$.
    ],
  )
]

#注[
  // TODO §1 后续可补:
  //   - 实矩阵情形: 复特征值成对出现时, 取实部 / 虚部得到实数值基本解
  //   - 对角化退化情形 (所有 Jordan 块都是 1x1)
  //   - 例: 2x2, 3x3 具体计算
]

=== 矩阵指数

#基本解矩阵 $#Phi基 _(bold(phi))$ 依赖于具体的基本解组 $bold(phi)$. 但用它构造的 $#Phi基 _(bold(phi))(t) #Phi基 _(bold(phi))(0)^(-1)$ 不依赖 $bold(phi)$ 选取, 这是一个良定的矩阵值函数 — 称为*矩阵指数*. 它统一了几个等价表述: Jordan 链解打包 / Banach 代数形式幂级数 / $#Phi基 _(bold(phi)) (0) = I$ 标准化的基本解矩阵.

#定义条目(
  "矩阵指数",
  "Matrix Exponential",
  uuid: "MatrixExponential",
)[
  #定义子句(
    主体: [$A$ 的*矩阵指数* $#expM (t A)$],
    内容: [
      $bb(R) -> "Mat"_(n times n)(bb(C))$ 函数 $#expM (t A) := #Phi基 _(bold(phi))(t) #Phi基 _(bold(phi))(0)^(-1)$, 其中 $bold(phi)$ 为 $dv(bold(x), t) = A bold(x)$ 的任一组 #常系数基本解.
    ],
    记号: $#expM (t A)$,
  )
]

#定理条目(
  "矩阵指数良定",
  "Matrix Exponential is Well-defined",
  uuid: "MatrixExponentialWelldefined",
)[
  #定理子句(
    cstyle: "display",
    条件: ([$bold(phi), bold(psi)$ 都是 $dv(bold(x), t) = A bold(x)$ 的 #常系数基本解],),
    结论: [
      $forall t in bb(R), #Phi基 _(bold(phi))(t) #Phi基 _(bold(phi))(0)^(-1) = #Phi基 _(bold(psi))(t) #Phi基 _(bold(psi))(0)^(-1)$.
    ],
  )
]

#注[
  设 $bold(psi) = bold(phi) M$, $M in op("GL")_n (bb(C))$ (任两组基本解之间相差一个右乘可逆矩阵, 来自 #齐次通解). 则 $#Phi基 _(bold(psi))(t) = #Phi基 _(bold(phi))(t) M$, 所以 $#Phi基 _(bold(psi))(t) #Phi基 _(bold(psi))(0)^(-1) = #Phi基 _(bold(phi))(t) M M^(-1) #Phi基 _(bold(phi))(0)^(-1) = #Phi基 _(bold(phi))(t) #Phi基 _(bold(phi))(0)^(-1)$.
]

#定理条目(
  "矩阵指数的关键性质",
  "Key Properties of the Matrix Exponential",
  uuid: "MatrixExponentialProperties",
)[
  #定理子句(
    cstyle: "display",
    条件: ([$A in "Mat"_(n times n)(bb(C))$],),
    结论: [
      $#structProp(
        (name: [初值归一], value: [$#expM (0 dot A) = I$]),
        (name: [矩阵 ODE], value: [$forall t in bb(R), dv(#expM (t A), t) = A #expM (t A) = #expM (t A) A$]),
        (name: [群性质], value: [$forall s\, t in bb(R), #expM ((s+t) A) = #expM (s A) dot #expM (t A)$]),
        (name: [处处可逆], value: [$forall t in bb(R), #expM (t A) in op("GL")_n (bb(C))$ 且 $#expM (t A)^(-1) = #expM (-t A)$]),
      )$
    ],
  )
]

#定理条目(
  "矩阵指数等于形式幂级数",
  "Matrix Exponential Equals Formal Power Series",
  uuid: "MatrixExponentialEqualsPowerSeries",
)[
  #定理子句(
    cstyle: "display",
    条件: ([$A in "Mat"_(n times n)(bb(C))$],),
    结论: [
      $forall t in bb(R), #expM (t A) = sum_(k=0)^(infinity) (t A)^k / k!$, 该级数在 $"Mat"_(n times n)(bb(C))$ 上 (任一相容矩阵范数下) 绝对收敛.
    ],
  )
]

#注[
  证明草: 形式幂级数 $S(t) := sum_(k=0)^infinity (t A)^k slash k!$ 在 $norm(A)$ 的算子范数下界以 $sum norm(A)^k t^k slash k! = e^(norm(A) t)$, 故绝对收敛. 逐项求导得 $S'(t) = A S(t)$, 又 $S(0) = I$. 由解的唯一性, $S(t)$ 等于由"初值 $I$ + 矩阵 ODE" 刻画的唯一函数, 即 #expM 满足同样的初值问题, 故二者相等.
]

#注[
  *齐次通解的简化表述*: 由 #矩阵指数的关键性质 "初值归一", 取 $#Phi基 _(bold(phi))(0) = I$ 的基本解组时, $#Phi基 _(bold(phi)) = #expM (dot A)$. 此时
  $ bold(x)(t) = #expM (t A) bold(x)(0). $
]

== 常系数非齐次线性微分方程组

#约定[
  - $n : bb(N)^*$
  - $A : "Mat"_(n times n)(bb(C))$
  - $I subset.eq bb(R)$ 是区间
  - $bold(b) : Cont(I, bb(C)^n)$
  - $bold(x) : I -> bb(C)^n$
]

#定义条目("常系数非齐次线性微分方程组", "Constant-coefficient Nonhomogeneous Linear System of ODEs", uuid: "NonhomogeneousLinearSystem")[
  #定义子句(
    主体: [由 $(A, bold(b))$ 决定的*常系数非齐次线性微分方程组*],
    内容: [#一阶向量ODE $bold(f) : I times bb(C)^n -> bb(C)^n, quad bold(f)(t, bold(x)) := A bold(x) + bold(b)(t)$],
    记号: $dv(bold(x), t) = A bold(x) + bold(b)(t)$,
  )
]

=== 解空间是 (特解) + (齐次解空间)

#定理条目(
  "非齐次方程组的解集是仿射空间",
  "Solution Set of Nonhomogeneous System is an Affine Space",
  uuid: "NonhomogeneousSolutionAffineSpace",
)[
  #定理子句(
    cstyle: "display",
    条件: ([$bold(x)_* in cal(S)_(A, bold(b))$ 是 #常系数非齐次线性方程组 的任一固定解 ("特解")],),
    结论: [
      映射 $cal(S)_A -> cal(S)_(A, bold(b)), bold(y) mapsto bold(x)_* + bold(y)$ 是双射. 故 $cal(S)_(A, bold(b)) = bold(x)_* + cal(S)_A$ 是 $cal(S)_A$ 上的仿射空间, 维度 $n$.
    ],
  )
]

#注[
  正向: 若 $bold(x)_1, bold(x)_2 in cal(S)_(A, bold(b))$, 则 $dv((bold(x)_1 - bold(x)_2), t) = A (bold(x)_1 - bold(x)_2)$, 即 $bold(x)_1 - bold(x)_2 in cal(S)_A$. 反向: 取 $bold(y) in cal(S)_A$, 则 $bold(x)_* + bold(y) in cal(S)_(A, bold(b))$.
]

=== 特解的构造: 变易系数法

由 #仿射解空间定理 知, 求 $cal(S)_(A, bold(b))$ 只需找一个特解 $bold(x)_* in cal(S)_(A, bold(b))$. 余下任务是构造特解.

齐次通解 $bold(x)(t) = (#Phi基 _(bold(phi))) (t) bold(c)$ 中 $bold(c)$ 是常向量. *变易系数法*的思想: 把 $bold(c)$ 替换为待定函数 $bold(c)(t)$, 强行让 $(#Phi基 _(bold(phi))) (t) bold(c)(t)$ 满足非齐次方程, 反解 $bold(c)(t)$.

#定义条目(
  "变易系数法",
  "Variation of Parameters",
  uuid: "VariationOfParameters",
)[
  #定义子句(
    主体: [基于 #基本解矩阵 $#Phi基 _(bold(phi))$, 非齐次项 $bold(b)$, 初值时刻 $t_0$ 的*变易系数法*输出 $#VOP (#Phi基 _(bold(phi)), bold(b), t_0)$],
    内容: [
      $I -> bb(C)^n$ 函数 $(#VOP (#Phi基 _(bold(phi)), bold(b), t_0))(t) := (#Phi基 _(bold(phi)))(t) integral_(t_0)^(t) (#Phi基 _(bold(phi)))(s)^(-1) bold(b)(s) dif s$.
    ],
    记号: $#VOP (#Phi基 _(bold(phi)), bold(b), t_0)$,
    条件: (
      [$bold(phi)$ 是齐次方程 $dv(bold(x), t) = A bold(x)$ 的一组 #常系数基本解],
      [$bold(b) : Cont(I, bb(C)^n)$],
      [$t_0 in I$],
    ),
  )
]

#定理条目(
  "变易系数法产生非齐次方程组的特解",
  "Variation of Parameters Produces a Particular Solution",
  uuid: "VOPGivesSolution",
)[
  #定理子句(
    cstyle: "display",
    条件: (
      [$bold(phi)$ 是 $dv(bold(x), t) = A bold(x)$ 的一组 #常系数基本解],
      [$bold(b) : Cont(I, bb(C)^n)$],
      [$t_0 in I$],
    ),
    结论: [
      $#structProp(
        (name: [是非齐次方程的解], value: [$#VOP (#Phi基 _(bold(phi)), bold(b), t_0) in cal(S)_(A, bold(b))$]),
        (name: [零初值], value: [$(#VOP (#Phi基 _(bold(phi)), bold(b), t_0))(t_0) = bold(0)$]),
      )$
    ],
  )
]

#注[
  验证 "是非齐次方程的解": 记 $bold(u)(t) := (#VOP (#Phi基 _(bold(phi)), bold(b), t_0))(t) = #Phi基 _(bold(phi))(t) bold(c)(t)$, 其中 $bold(c)(t) := integral_(t_0)^t #Phi基 _(bold(phi))(s)^(-1) bold(b)(s) dif s$. 则
  $
    bold(u)'(t) &= #Phi基 _(bold(phi))'(t) bold(c)(t) + #Phi基 _(bold(phi))(t) bold(c)'(t) \
    &= A #Phi基 _(bold(phi))(t) bold(c)(t) + #Phi基 _(bold(phi))(t) #Phi基 _(bold(phi))(t)^(-1) bold(b)(t) \
    &= A bold(u)(t) + bold(b)(t),
  $
  其中第二步用了 #基本解矩阵的关键性质 (矩阵 ODE) 与 微积分基本定理.
]

#注[
  把 #变易系数法是特解 + #仿射解空间定理 合起来:
  $ cal(S)_(A, bold(b)) = #VOP (#Phi基 _(bold(phi)), bold(b), t_0) + cal(S)_A. $
  即*非齐次通解* = *变易系数法给的特解* + *齐次通解*. 显式公式由 #齐次通解 给出:
  $ bold(x)(t) = #Phi基 _(bold(phi))(t) bold(c) + (#VOP (#Phi基 _(bold(phi)), bold(b), t_0))(t), quad bold(c) in bb(C)^n. $
  其中 $bold(c) = #Phi基 _(bold(phi))(t_0)^(-1) bold(x)(t_0)$, 当 $#Phi基 _(bold(phi))(t_0) = I$ 时 $bold(c) = bold(x)(t_0)$.
]

#注[
  *非齐次通解的简化表述*: 由 #矩阵指数的关键性质 取 $#Phi基 _(bold(phi)) = #expM (dot A)$ (即取 $#Phi基 _(bold(phi)) (0) = I$ 的基本解组), 则
  $ bold(x)(t) = #expM ((t - t_0) A) bold(x)(t_0) + integral_(t_0)^(t) #expM ((t - s) A) bold(b)(s) dif s. $
  右端首项是齐次通解 (#矩阵指数的关键性质 "群性质" 把 $#expM (t A) #expM (-t_0 A)$ 合并为 $#expM ((t-t_0) A)$), 第二项是 #变易系数法 的简化 (类似合并).
]

#注[
  // TODO §2 后续可补:
  //   - 共振情形 (b 与齐次解空间有共同 e^(λt) 因子)
  //   - 具体例: b(t) 为多项式 / 指数 / 三角 时的对照表
]

== 周期系数线性微分方程组

// TODO: 待写
//   - Floquet 理论框架
//   - 单调矩阵与 Floquet 指数
#注[
  本节内容待补.
]

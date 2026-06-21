// Mathematics/26-RealAnalysis/main.typ
//
// 实分析 (Lebesgue 框架, Royden 4th ed Part I 路线)
//
// 章节顺序 (猫猫 2026-06-18 拍板):
//   §1 Lebesgue 可测函数 (含简单逼近)
//   §2 可测函数列的收敛
//   §3 Lebesgue 积分
//   §4 微分与不定积分
//   §5 乘积测度与 Fubini
//   §6 L^p 空间
//
// 现存 12 entry (2026-06 前) 已迁移到新 #*条目 + #*子句 体系
// 全部 entry body 按 Royden 4th ed Part I 路线填好

#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../contributors.typ": *
#import "export.typ": *

#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../06-OrderTheory/export.typ": *
#import "../08-BasicAlgebra/export.typ": *
#import "../15-LinearAlgebra/export.typ": *
#import "../54-Topology/main.typ": *
#import "../28-MeasureTheory/export.typ": *
#import "../26-BasicAnalysis/export.typ": *
#import "../46-FunctionalAnalysis/export.typ": *

#show: FulcrumCN
#show: TypeStyle
#show: SetStyle
#show: AlgebraStyle
#show: MeasureTheoryStyle
#show: RealAnalysisStyle

#title([实分析])

#outline(title: "目录", indent: 2em)

#pagebreak()


// ============================================================
= Lebesgue 可测函数
// ============================================================

== 基本定义

#约定[
  - $D : Set(Real)$
  - $D #集合Lebesgue可测$
  - $f, g : D -> EReal$
]

#定义条目("Lebesgue 可测函数", "Lebesgue Measurable Function", uuid: "LebesgueMeasurableFunction", contributors: (猫猫,))[
  #定义子句(
    主体: [$f$ #函数Lebesgue可测],
    isPredicate: true,
    bstyle: "display",
    内容: [$ forall c : EReal, #setOf($x$, $f(x) <= c$) #集合Lebesgue可测 $],
  )
]

#性质条目("Lebesgue 可测函数的等价定义", "", uuid: "LebesgueMeasurableFunctionIff", contributors: (猫猫,))[
  #定理子句(
    hstyle: "display",
    条件: (
      令($alpha$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) <= c$) #集合Lebesgue可测$]),
      令($beta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) < c$) #集合Lebesgue可测$]),
      令($gamma$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) >= c$) #集合Lebesgue可测$]),
      令($delta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) > c$) #集合Lebesgue可测$]),
      令($epsilon$, type: $Prop$, [$forall O : Set(EReal), O$ 是开集 $implies f^(-1)(O) #集合Lebesgue可测$]),
      令($zeta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) = c$) #集合Lebesgue可测$]),
    ),
    结论: [$alpha iff beta iff gamma iff delta iff epsilon implies zeta$],
  )
]

#性质条目("Lebesgue 可测函数代数", "", uuid: "LebesgueMeasurableFunctionAlgebra", contributors: (猫猫,))[
  #结构子句(
    主体: [$#setOf($f$, type: $D -> EReal$, $f #函数Lebesgue可测$)$ 是 $Real$ 上的#代数],
    isPredicate: true,
    成员: (
      (name: [加法], name_en: [Addition], value: $(f, g : D -> EReal) mapsto (x mapsto f(x) + g(x))$),
      (name: [数乘], name_en: [Scalar Multiplication], value: $(k : Real, f : D -> EReal) mapsto (x mapsto k dot f(x))$),
      (name: [乘法], name_en: [Multiplication], value: $(f, g : D -> EReal) mapsto (x mapsto f(x) dot g(x))$),
    ),
  )
]

#反例条目("Lebesgue 可测函数的复合不一定 Lebesgue 可测", "", uuid: "LebesgueMeasurableFunctionComposite", contributors: (猫猫,))[
  $exists f, g : D -> EReal, f, g #函数Lebesgue可测 and g compose f #函数Lebesgue不可测$。
]


== 例: 常见的可测函数

#例条目("连续函数 Lebesgue 可测", "", uuid: "ContinuousLebesgueMeasurable", contributors: (猫猫,))[
  设 $f$ #实函数连续，则 $f$ #函数Lebesgue可测。
]

#例条目("单调函数 Lebesgue 可测", "", uuid: "MonotoneLebesgueMeasurable", contributors: (猫猫,))[
  设 $f$ #单调，则 $f$ #函数Lebesgue可测。
]


== 几乎处处相等与依测度等价

#定义条目("几乎处处相等", "Almost Everywhere Equal", uuid: "AlmostEverywhereEqual")[
  #定义子句(
    主体: [$f$ 与 $g$ #几乎处处相等],
    isPredicate: true,
    内容: [#几乎处处 $x in D, f(x) = g(x)$],
  )
]

#定义条目("依测度等价", "Equivalence by Measure", uuid: "LebesgueMeasureFunctionEquiv", contributors: (猫猫,))[
  #定义子句(
    主体: [$f$ 与 $g$ #依测度等价],
    isPredicate: true,
    内容: [#几乎处处 $x mapsto (x in D implies f(x) = g(x))$],
  )
]

#性质条目("依测度等价是等价关系", "", uuid: "LebesgueMeasureFunctionEquivEquivalence", contributors: (猫猫,))[
  #定理子句(
    结论: [#依测度等价;是 $D -> EReal$ 上的等价关系],
  )
]

#性质条目("函数的 Lebesgue 可测性沿依测度等价传递", "", uuid: "LebesgueMeasureFunctionEquivMeasurable", contributors: (猫猫,))[
  #定理子句(
    条件: ([~$f$ 与 $g$ #依测度等价], [$f$ #函数Lebesgue可测]),
    结论: [$g$ #函数Lebesgue可测],
  )
]


== 简单逼近定理

#约定[
  - $phi, psi : D -> EReal$
]

#定义条目("简单函数", "Simple Function", uuid: "SimpleFunction", contributors: (猫猫,))[
  #定义子句(
    主体: [$phi$ 是#简单;函数],
    isPredicate: true,
    内容: [$phi #函数Lebesgue可测 and card(phi(D)) < infinity$],
  )
]

#引理条目("简单逼近引理", "Simple Approximation Lemma", uuid: "SimpleFunctionApproximation", contributors: (猫猫,))[
  #定理子句(
    cstyle: "display",
    条件: ([~$f$ #函数Lebesgue可测], [$f$ #函数有界], [$epsilon : PReal$]),
    结论: [$
      exists phi\, psi : D -> ENNReal,
      #structProp(
        (name: [简单性], value: [$phi, psi$ 是#简单;函数]),
        (name: [控制性], value: [$forall x in D, phi(x) <= f(x) <= psi(x)$]),
        (name: [精确性], value: [$forall x in D, psi(x) - phi(x) <= epsilon$]),
      )
    $],
  )
]

#定理条目("简单逼近定理", "Simple Approximation Theorem", uuid: "SimpleApproximationTheorem")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : D -> EReal$ #函数Lebesgue可测], [$f >= 0$]),
    结论: [$
      exists phi_n : D -> ENNReal,
      #structProp(
        (name: [简单性], value: [$forall n : bb(N), phi_n$ 是#简单;函数]),
        (name: [单调上升], value: [$forall x in D, phi_n (x) <= phi_(n+1) (x)$]),
        (name: [逐点收敛], value: [$forall x in D, lim_(n -> infinity) phi_n (x) = f(x)$]),
        (name: [有界部分一致], value: [若 $f$ 在某可测子集 $E subset.eq D$ 上有界，则 $phi_n -> f$ 在 $E$ 上一致]),
      )
    $],
  )
]


// ============================================================
= 可测函数列的收敛
// ============================================================

== 几乎处处收敛

#约定[
  - $D : Set(Real)$
  - $D #集合Lebesgue可测$
  - $f_n, f : D -> EReal$
]

#定义条目("几乎处处收敛", "Almost Everywhere Convergence", uuid: "AlmostEverywhereConvergence")[
  #定义子句(
    主体: [$f_n -> f$ 在 $D$ 上#几乎处处收敛],
    isPredicate: true,
    内容: [#几乎处处 $x : D, lim_(n -> infinity) f_n (x) = f(x)$],
    记号: $f_n thin ae逐点收敛符(D) thin f$,
  )
]

#定义条目("几乎一致收敛", "Almost Uniform Convergence", uuid: "AlmostUniformConvergence")[
  #定义子句(
    主体: [$f_n -> f$ 在 $D$ 上#几乎一致收敛],
    isPredicate: true,
    内容: [$forall epsilon > 0, exists E in cal(L) (D), m(E) < epsilon and f_n thin 一致收敛符(D without E) thin f$],
    记号: $f_n thin ae一致收敛符(D) thin f$,
  )
]

#性质条目("几乎一致收敛蕴含几乎处处与依测度收敛", "", uuid: "AlmostUniformImpliesAeAndMeasure", contributors: (猫猫,))[
  #定理子句(
    条件: ([~$f_n, f : D -> EReal$ #函数Lebesgue可测], [$f_n thin ae一致收敛符(D) thin f$]),
    结论: [$f_n thin ae逐点收敛符(D) thin f$ #h(0.5em) 且 #h(0.5em) $f_n thin 依测度收敛符(D) thin f$],
  )
]

#定义条目("依测度收敛", "Convergence in Measure", uuid: "ConvergenceInMeasure")[
  #定义子句(
    主体: [$f_n -> f$ 在 $D$ 上#依测度收敛],
    isPredicate: true,
    内容: [$forall eta > 0, lim_(n -> infinity) m({ x in D | |f_n (x) - f(x)| >= eta }) = 0$],
    记号: $f_n thin 依测度收敛符(D) thin f$,
  )
]

#性质条目("有限测度集上几乎处处收敛蕴含依测度收敛", "", uuid: "AeImpliesMeasureOnFinite", contributors: (猫猫,))[
  #定理子句(
    条件: ([~$m(D) < infinity$], [$f_n, f : D -> EReal$ #函数Lebesgue可测], [$f_n thin ae逐点收敛符(D) thin f$]),
    结论: [$f_n thin 依测度收敛符(D) thin f$],
  )
]


== 三大经典定理

#定理条目("Egorov 定理", "Egorov's Theorem", uuid: "EgorovTheorem")[
  #定理子句(
    条件: ([~$m(D) < infinity$], [$f_n thin ae逐点收敛符(D) thin f$], [$f$ 几乎处处取有限值]),
    结论: [$f_n thin ae一致收敛符(D) thin f$],
  )
]

#反例条目("Egorov 定理的有限测度条件不可去", "", uuid: "EgorovFiniteMeasureNeeded", contributors: (猫猫,))[
  取 $D = bb(R)$，$f_n = chi_([n\, n+1])$。则 $f_n thin 逐点收敛符(D) thin 0$（从而 $f_n thin ae逐点收敛符(D) thin 0$），但 $f_n$ 不在 $D$ 上 #几乎一致收敛 到 $0$（任意 $E in cal(L) (D)$ 满足 $m(E) < 1$，$D without E$ 仍含无穷多个 $[n, n+1]$，$sup_(x in D without E) |f_n (x)| = 1 arrow.r.not 0$）。
]

#定理条目("Lusin 定理", "Lusin's Theorem", uuid: "LusinTheorem")[
  #定理子句(
    条件: ([~$f : D -> Real$], [$f$ 几乎处处取有限值]),
    结论: [$f$ #函数Lebesgue可测#iff;$forall epsilon > 0, exists$ 闭集 $K subset.eq D, m(D without K) < epsilon$，且 $exists g : D -> Real$，$g$ #实函数连续;且 $forall x : K, g(x) = f(x)$],
  )
]

#定理条目("Riesz 定理", "Riesz's Theorem", uuid: "RieszTheorem")[
  #定理子句(
    条件: ([~$f_n thin 依测度收敛符(D) thin f$]),
    结论: [$exists$ 子列 $f_(n_k) thin ae逐点收敛符(D) thin f$],
  )
]


// ============================================================
= Lebesgue 积分
// ============================================================

== 简单函数的积分

#约定[
  - $D : Set(Real)$
  - $D #集合Lebesgue可测$
  - $m$ 是#Lebesgue测度
]

#定义条目("简单函数积分", "Simple Function Integral", uuid: "SimpleFunctionIntegral")[
  #定义子句(
    bstyle: "display",
    条件: ([~$phi : D -> [0, infinity)$ 是#简单;函数], [$phi = sum_(i=1)^n a_i chi_(E_i)$ 是 $phi$ 的标准形, $a_i in [0, infinity)$, $E_i$ 是 $D$ 的可测分划]),
    主体: [$phi$ 在 $D$ 上的#简单函数积分],
    内容: [$sum_(i=1)^n a_i dot m(E_i)$，约定 $0 dot infinity = 0$],
    记号: $integral_D phi$,
  )
]

#注条目("", "")[
  简单函数积分的值不依赖于标准表示的选取。允许 $a_i = 0$ 或 $m(E_i) = infinity$（采用 $0 dot infinity = 0$ 约定）。
]

#性质条目("简单函数积分的线性 / 单调性", "Linearity and Monotonicity of Simple Integral", uuid: "SimpleFunctionIntegralProperties")[
  #定理子句(
    条件: ([~$phi, psi : D -> [0, infinity)$ 是#简单;函数], [$alpha, beta in [0, infinity)$]),
    cstyle: "display",
    结论: [$
      #structProp(
        (name: [线性], value: $integral_D (alpha phi + beta psi) = alpha integral_D phi + beta integral_D psi$),
        (name: [单调], value: [$phi <= psi$ 在 $D$ 上 $==> integral_D phi <= integral_D psi$]),
      )
    $],
  )
]


== 非负可测函数的积分

#约定[
  - $f : D -> [0, infinity]$ #函数Lebesgue可测
]

#定义条目("非负可测函数积分", "Nonnegative Measurable Integral", uuid: "NonnegativeMeasurableIntegral")[
  #定义子句(
    bstyle: "display",
    主体: [$f$ 的#非负可测函数积分 $: ENNReal$],
    内容: $Sup(#setOf($integral_D phi$, type: $D -> [0\, infinity)$, $phi #h(0.3em) "是" #h(0.2em) #简单 "函数" and 0 <= phi <= f$))$,
    记号: $integral_D f$,
  )
]

#注条目("", "")[
  此积分定义在整个非负可测函数类型上，值域为 $ENNReal = [0, infinity]$，永远良定。$integral_D f = infinity$ 时称 $f$ 在 $D$ 上不可积。
]

#定理条目("Levi 单调收敛定理", "Monotone Convergence Theorem", uuid: "MonotoneConvergenceTheorem")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f_n : D -> [0, infinity]$ #函数Lebesgue可测], [$forall x in D, f_n (x) <= f_(n+1) (x)$], [$f(x) := lim_(n -> infinity) f_n (x)$]),
    结论: [$lim_(n -> infinity) integral_D f_n = integral_D f$],
  )
]

#引理条目("Fatou 引理", "Fatou's Lemma", uuid: "FatouLemma")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f_n : D -> [0, infinity]$ #函数Lebesgue可测]),
    结论: [$integral_D (liminf_(n -> infinity) f_n) <= liminf_(n -> infinity) integral_D f_n$],
  )
]

#性质条目("非负积分的线性 / 单调 / 可数可加", "", uuid: "NonnegativeIntegralProperties")[
  #定理子句(
    cstyle: "display",
    结论: [$
      #structProp(
        (name: [线性], value: [$integral_D (alpha f + beta g) = alpha integral_D f + beta integral_D g$，其中 $alpha, beta in [0, infinity)$]),
        (name: [单调], value: [$f <= g$ a.e. $==> integral_D f <= integral_D g$]),
        (name: [可数可加], value: [$D = union.big_(n : bb(N)) D_n$ 为可测互不相交并 $==> integral_D f = sum_(n : bb(N)) integral_(D_n) f$]),
      )
    $],
  )
]


== 一般可测函数的 Lebesgue 积分

#约定[
  - $f : D -> EReal$ #函数Lebesgue可测
  - $f^+ := max(f, 0) : D -> ENNReal$, $f^- := max(-f, 0) : D -> ENNReal$（正部 / 负部, 均非负可测）
]

#定义条目("Lebesgue 积分", "Lebesgue Integral", uuid: "LebesgueIntegral")[
  #定义子句(
    bstyle: "display",
    主体: [$f$ 的#Lebesgue积分 $: EReal$],
    内容: [$
      cases(
        integral_D f^+ - integral_D f^-\, &"若" integral_D f^+ < infinity #h(0.3em) "或" #h(0.3em) integral_D f^- < infinity\,,
        "未定义"\, &"若" integral_D f^+ = integral_D f^- = infinity
      )
    $],
    记号: $integral_D f$,
  )
]

#定义条目("Lebesgue 可积", "Lebesgue Integrable", uuid: "LebesgueIntegrable")[
  #定义子句(
    bstyle: "display",
    主体: [$f$ 在 $D$ 上#Lebesgue可积],
    isPredicate: true,
    内容: [$integral_D |f| < infinity$，等价于 $integral_D f^+ < infinity and integral_D f^- < infinity$，等价于 $integral_D f in Real$（即积分有限）],
  )
]

#注条目("", "")[
  Lebesgue 积分作为函数定义在可测函数类型上 (非负情形值域 $ENNReal$，永远良定；一般情形值域 $EReal$，需 $f^+, f^-$ 不全为 $infinity$)。#strong[Lebesgue 积分的可积性与函数的局部性质无关，只与积分值是否发散至无穷远有关]：当函数可测时，$f$ 的可积性恰等价于 $integral_D |f| < infinity$。
]

#性质条目("有限测度集上的有界可测函数可积", "Bounded Measurable on Finite Measure Set is Integrable", uuid: "BoundedOnFiniteMeasureIntegrable")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : D -> Real$ #函数Lebesgue可测], [$f$ #函数有界], [$m(D) < infinity$]),
    结论: [$f$ 在 $D$ 上#Lebesgue可积，且 $integral_D |f| <= op("sup")_(x in D) |f(x)| dot m(D)$],
  )
]

#性质条目("Riemann 可积与 Lebesgue 积分的兼容性", "Compatibility with Riemann Integral", uuid: "LebesgueRiemannCompatibility")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : [a, b] -> Real$ 在 $[a, b]$ 上 Riemann 可积]),
    结论: [$f$ 在 $[a, b]$ 上#Lebesgue可积，且 Lebesgue 积分等于 Riemann 积分：$integral_([a, b]) f = integral_a^b f(x) dif x$],
  )
]

#定理条目("Lebesgue 控制收敛定理", "Dominated Convergence Theorem", uuid: "DominatedConvergenceTheorem")[
  #定理子句(
    条件: ([~$f_n, f : D -> EReal$ #函数Lebesgue可测], [$f_n -> f$ a.e. 在 $D$], [$exists g : D -> [0, infinity]$ #Lebesgue可积, $forall n, |f_n| <= g$ a.e.]),
    cstyle: "display",
    结论: [
      - $f, f_n$ 均在 $D$ 上#Lebesgue可积；
      - $lim_(n -> infinity) integral_D f_n = integral_D f$；
      - $lim_(n -> infinity) integral_D |f_n - f| = 0$（即 $f_n -> f$ 在 $L^1 (D)$ 范数下）。
    ],
  )
]

#性质条目("Lebesgue 积分的线性 / 单调 / 三角不等式", "", uuid: "LebesgueIntegralProperties")[
  #定理子句(
    条件: ([~$f, g : D -> EReal$ #Lebesgue可积], [$alpha, beta : Real$]),
    cstyle: "display",
    结论: [$
      #structProp(
        (name: [线性], value: [$alpha f + beta g$ #Lebesgue可积，且 $integral_D (alpha f + beta g) = alpha integral_D f + beta integral_D g$]),
        (name: [单调], value: $f <= g #h(0.5em) "a.e." ==> integral_D f <= integral_D g$),
        (name: [三角不等式], value: $|integral_D f| <= integral_D |f|$),
      )
    $],
  )
]


== 与 Riemann 积分的关系

#定理条目("Riemann 可积的 Lebesgue 刻画", "Lebesgue Characterization of Riemann Integrability", uuid: "LebesgueCharRiemann")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$ 有界]),
    结论: [$f$ 在 $[a, b]$ 上 Riemann 可积#iff;$f$ 在 $[a, b]$ 上的不连续点集 Lebesgue 测度为 $0$],
  )
]


// ============================================================
= 微分与不定积分
// ============================================================

== Vitali 覆盖与单调函数的可微性

#约定[
  - $E subset.eq Real$
  - $cal(V)$ 是 $E$ 的一族闭区间
]

#定义条目("Vitali 覆盖", "Vitali Cover", uuid: "VitaliCover")[
  #定义子句(
    主体: [$cal(V)$ 是 $E$ 的#Vitali覆盖],
    isPredicate: true,
    内容: [$forall x in E, forall epsilon > 0, exists I in cal(V), x in I and ell(I) < epsilon$（其中 $ell(I)$ 为闭区间长度）],
  )
]

#引理条目("Vitali 覆盖引理", "Vitali Covering Lemma", uuid: "VitaliCoveringLemma")[
  #定理子句(
    条件: ([~$E subset.eq Real$], [$m^*(E) < infinity$ （外测度有限）], [$cal(V)$ 是 $E$ 的#Vitali覆盖]),
    结论: [$forall epsilon > 0, exists$ 有限不交子族 $I_1, dots, I_n in cal(V), m^*(E without union.big_(k=1)^n I_k) < epsilon$],
  )
]

#定理条目("Lebesgue 定理: 单调函数 a.e. 可微", "Lebesgue's Theorem on Differentiation of Monotone Functions", uuid: "MonotoneAlmostEverywhereDifferentiable")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$ 单调]),
    cstyle: "display",
    结论: [
      - $f$ 在 $(a, b)$ 上几乎处处可微；
      - $f'$ 在 $[a, b]$ 上#Lebesgue可积；
      - 若 $f$ 单调递增，则 $integral_a^b f' <= f(b) - f(a)$。
    ],
  )
]

#注条目("", "")[
  $integral_a^b f' <= f(b) - f(a)$ 一般为严格不等式。等号成立当且仅当 $f$ 在 $[a, b]$ 上#绝对连续（见 FTOC）。Cantor 函数提供典型反例：连续单增、$f' = 0$ a.e.，但 $f(1) - f(0) = 1 > 0 = integral_0^1 f'$。
]


== 有界变差函数

#约定[
  - $f : [a, b] -> Real$
  - $P : a = x_0 < x_1 < dots < x_n = b$ 为 $[a, b]$ 的分划
]

#定义条目("全变差", "Total Variation", uuid: "TotalVariation")[
  #定义子句(
    主体: [$f$ 在 $[a, b]$ 上的#全变差],
    内容: [$sup_(P) sum_(i=1)^n |f(x_i) - f(x_(i-1))|$，对所有分划 $P$ 取上确界],
    记号: $V_a^b (f)$,
  )
]

#定义条目("有界变差", "Bounded Variation", uuid: "BoundedVariation")[
  #定义子句(
    主体: [$f$ 在 $[a, b]$ 上#有界变差],
    isPredicate: true,
    内容: [$V_a^b (f) < infinity$],
  )
]

#定理条目("Jordan 分解", "Jordan Decomposition", uuid: "JordanDecomposition")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$]),
    结论: [$f$ #有界变差#iff;$exists$ 单调递增函数 $g, h : [a, b] -> Real$, $f = g - h$],
  )
]

#性质条目("有界变差蕴含 a.e. 可微", "")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$ #有界变差]),
    结论: [$f$ 在 $(a, b)$ 上几乎处处可微，且 $f'$ 在 $[a, b]$ 上#Lebesgue可积],
  )
]


== 绝对连续与微积分基本定理

#约定[
  - $f : [a, b] -> Real$
  - $E subset.eq [a, b]$ 为 $[a, b]$ 的 Lebesgue 可测子集
]

#定义条目("可测集上的全变差", "Total Variation on a Measurable Set", uuid: "TotalVariationOnMeasurableSet")[
  #定义子句(
    bstyle: "display",
    条件: ([~$f : [a, b] -> Real$], [$E subset.eq [a, b]$ 任意子集]),
    主体: [$f$ 在 $E$ 上的#全变差],
    内容: [$V_E (f) := inf { sum_(n=1)^(infinity) V_(alpha_n)^(beta_n) (f) : E subset.eq union.big_(n=1)^(infinity) (alpha_n, beta_n) subset.eq [a, b] }$，对所有由 $[a, b]$ 中开区间构成的可数覆盖取下确界 (允许空覆盖, $V_(emptyset) (f) := 0$)],
    记号: $V_E (f)$,
  )
]

#注条目("", "")[
  - #strong[外覆盖];形式 (analogous to outer measure), #strong[不是];"$E$ 内开区间的 sup"。原因: Cantor 集 $C$ 的 Lebesgue 测度为 $0$, 但 Devil's staircase $f$ 在 $C$ 上承载全部增长——若取 inner 形式则 $V_C (f) = 0$, 会让 Devil's staircase 被错判为绝对连续。
  - #strong[可数];覆盖 (非有限) 是必要的, 否则 $V_(dot) (f)$ 只能做到有限可加, 后续 $sigma$-可加性失败。
  - 当 $E = [alpha, beta]$ 为区间时, $V_E (f)$ 与单调分划 sup 形式给出的 $V_alpha^beta (f)$ 一致。
  - 当 $f$ 非#有界变差;时, $V_([a,b]) (f) = +infinity$, 与 outer-cover inf 的取值范围 $[0, +infinity]$ 自然相容。
]

#性质条目("可测集上全变差是 Borel 测度", "V_E(f) is a Borel Measure", uuid: "TotalVariationIsBorelMeasure")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : [a, b] -> Real$]),
    结论: [
      - $E mapsto V_E (f)$ 是 $[a, b]$ 上的一个外测度 (即非负、$V_(emptyset) (f) = 0$、单调、可数次可加);
      - 由 Carathéodory 构造, 限制到由 $V_(dot)(f)$ 诱导的 Carathéodory $sigma$-代数 $cal(M)_(V_f)$ 上, 是一个完备的 (非负, 可能取 $+infinity$ 值的) 测度;
      - $scr(B) ([a, b]) subset.eq cal(M)_(V_f)$, 故 $V_(dot) (f)$ 限制到 #Borel集族 上是一个 $[a, b]$ 上的#Borel测度, 满足 $sigma$-可加: 若 $E = union.big.sq.big_(n=1)^infinity E_n$ 是不交可数 Borel 并, 则 $V_E (f) = sum_(n=1)^infinity V_(E_n) (f)$;
      - 当 $f$ 在 $[a, b]$ 上#有界变差;时, 此测度有限, $V_([a, b]) (f) < infinity$。
    ],
  )
]

#注条目("", "")[
  这是 Lebesgue-Stieltjes 框架的"裸"版本: 不诱导符号测度, 直接用全变差 outer-measure 构造给出 $|mu_f|$ 的几何对象。优雅在于"测度 = 几何长度被 $f$ 放大后的对应物"这个直觉 — $V_(dot) (f)$ 度量的是"$f$ 在该集合上消耗的振幅总量"。后续可在 §符号测度 / Radon-Nikodym 一节将其与 Stieltjes 测度 $|mu_f|$ 同构。
]

#定义条目("绝对连续", "Absolutely Continuous", uuid: "AbsolutelyContinuous")[
  #定义子句(
    bstyle: "display",
    主体: [$f$ 在 $[a, b]$ 上#绝对连续],
    isPredicate: true,
    内容: [$lim_(m(E) -> 0^+) V_E (f) = 0$，即 $forall epsilon > 0, exists delta > 0, forall E in cal(L) ([a, b]), m(E) < delta ==> V_E (f) < epsilon$],
  )
]

#性质条目("绝对连续的 Royden 刻画", "Royden's Characterization of Absolute Continuity", uuid: "AbsolutelyContinuousIff")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : [a, b] -> Real$]),
    结论: [以下等价:
      + $f$ 在 $[a, b]$ 上#绝对连续;
      + $forall epsilon > 0, exists delta > 0$, 对 $[a, b]$ 中任意有限两两不交开区间族 $\{(alpha_i, beta_i)\}_(i=1)^n$, $sum_(i=1)^n (beta_i - alpha_i) < delta ==> sum_(i=1)^n V_(alpha_i)^(beta_i) (f) < epsilon$;
      + 上一条把 $sum V_(alpha_i)^(beta_i)(f)$ 换成 $sum |f(beta_i) - f(alpha_i)|$ 仍等价 (经典 Royden 形式).
    ],
  )
]

#性质条目("Lipschitz 蕴含绝对连续", "Lipschitz Implies Absolutely Continuous", uuid: "LipschitzImpliesAbsolutelyContinuous")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$], [$f$ 是#Lipschitz;的，常数 $L$]),
    结论: [$f$ 在 $[a, b]$ 上#绝对连续],
  )
]

#性质条目("绝对连续蕴含一致连续", "Absolutely Continuous Implies Uniformly Continuous", uuid: "AbsolutelyContinuousImpliesUniformlyContinuous")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$ 在 $[a, b]$ 上#绝对连续]),
    结论: [$f$ 在 $[a, b]$ 上#实函数一致连续；进而#实函数连续],
  )
]

#性质条目("绝对连续蕴含有界变差", "Absolutely Continuous Implies Bounded Variation", uuid: "AbsolutelyContinuousImpliesBoundedVariation")[
  #定理子句(
    条件: ([~$f : [a, b] -> Real$ 在 $[a, b]$ 上#绝对连续]),
    结论: [$f$ 在 $[a, b]$ 上#有界变差],
  )
]

#注条目("", "")[
  紧致区间 $[a, b]$ 上绝对连续自动蕴含有界变差：取定义中 $epsilon = 1$ 对应 $delta$，把 $[a, b]$ 等分成 $N = ceil((b-a) slash delta)$ 个长 $< delta$ 的子区间 (每段 Lebesgue 测度 $< delta$, 故 $V_(I_k) (f) < 1$), 累加得 $V_a^b (f) <= N < infinity$。本质上靠 $[a, b]$ 的紧致性 (有限 Lebesgue 测度)，在无界区间或一般测度集上不成立。
]

#性质条目("BV([a,b]) 是 Banach 空间", "BV is a Banach Space", uuid: "BVIsBanach")[
  #定理子句(
    cstyle: "display",
    结论: [
      - 记 $"BV" ([a, b]) := \{ f : [a, b] -> Real | f #有界变差 \}$。它是 $Real$ 上的#线性空间。
      - 在其上定义 $|| f ||_("BV") := |f(a)| + V_([a, b]) (f)$, 则 $||dot||_("BV")$ 是 $"BV" ([a, b])$ 上的范数 (常数项 $|f(a)|$ 用以 kill 常数 kernel)。
      - $("BV" ([a, b]), ||dot||_("BV"))$ 是 #bs (使用 Helly selection 定理证完备性: BV 中 Cauchy 列有逐点收敛子列, 极限仍 BV 且 $|| dot ||_("BV")$-收敛)。
    ],
  )
]

#注条目("", "")[
  $V_([a, b]) (dot)$ 本身只是 #半范数 (常数函数全变差为 $0$), 需加 $|f(a)|$ 项才升级成范数。等价的选择: 商掉常数得 $"BV" ([a, b]) slash Real$, 上面 $V_([a, b]) (dot)$ 直接是范数。两种处理在文献中都常见。
]

#定义条目("不定积分", "Indefinite Integral", uuid: "IndefiniteIntegral")[
  #定义子句(
    bstyle: "display",
    条件: ([~$f : [a, b] -> Real$ #Lebesgue可积]),
    主体: [$f$ 的#不定积分],
    内容: [$F : [a, b] -> Real$, $F(x) := integral_a^x f + C$，$C$ 为常数],
  )
]

#性质条目("不定积分是绝对连续", "", uuid: "IndefiniteIntegralAbsolutelyContinuous")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : [a, b] -> Real$ #Lebesgue可积]),
    结论: [$F(x) := integral_a^x f$ 在 $[a, b]$ 上#绝对连续；进而#有界变差],
  )
]

#定理条目("Lebesgue 微分定理", "Lebesgue Differentiation Theorem", uuid: "LebesgueDifferentiationTheorem")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : [a, b] -> Real$ #Lebesgue可积], [$F(x) := integral_a^x f$]),
    结论: [$F'(x) = f(x)$ 在 $[a, b]$ 上几乎处处],
  )
]

#定理条目("微积分基本定理 (Lebesgue 形式)", "Fundamental Theorem of Calculus (Lebesgue)", uuid: "FundamentalTheoremCalculusLebesgue")[
  #定理子句(
    cstyle: "display",
    条件: ([~$f : [a, b] -> Real$]),
    结论: [$f$ 在 $[a, b]$ 上#绝对连续#iff;$f'$ 存在 a.e.、$f'$ 在 $[a, b]$ 上#Lebesgue可积、且 $forall x in [a, b], f(x) = f(a) + integral_a^x f'$],
  )
]


// ============================================================
= 乘积测度与 Fubini 定理
// ============================================================

== 乘积可测结构

#约定[
  - $(X, cal(A), mu), (Y, cal(B), nu)$ 是#测度空间，且均为 $sigma$-有限
]

#定义条目("乘积 $sigma$-代数", "Product Sigma-Algebra", uuid: "ProductSigmaAlgebra")[
  #定义子句(
    主体: [$cal(A)$ 与 $cal(B)$ 的#乘积Sigma代数],
    内容: [由 ${ A times B | A in cal(A), B in cal(B) }$ 生成的 $X times Y$ 上的 $sigma$-代数],
    记号: $cal(A) times.o cal(B)$,
  )
]

#定义条目("截面", "Cross-Section", uuid: "CrossSection")[
  #定义子句(
    条件: ([~$E subset.eq X times Y$], [$x : X$, $y : Y$]),
    主体: [$E$ 在 $x$ 处的#截面;与在 $y$ 处的#截面],
    bstyle: "display",
    内容: [
      - $E_x := { y : Y | (x, y) in E } subset.eq Y$；
      - $E^y := { x : X | (x, y) in E } subset.eq X$。
    ],
  )
]

#定义条目("乘积测度", "Product Measure", uuid: "ProductMeasure")[
  #定义子句(
    主体: [$mu$ 与 $nu$ 的#乘积测度],
    内容: [$X times Y$ 上 $cal(A) times.o cal(B)$ 上的唯一 $sigma$-有限测度 $pi$, 满足 $forall A in cal(A), B in cal(B), pi(A times B) = mu(A) dot nu(B)$（采用 $0 dot infinity = 0$ 约定）],
    记号: $mu times.o nu$,
  )
]


== Fubini 与 Tonelli 定理

#定理条目("Tonelli 定理", "Tonelli's Theorem", uuid: "TonelliTheorem")[
  #定理子句(
    条件: ([~$f : X times Y -> [0, infinity]$ 是 $cal(A) times.o cal(B)$-可测]),
    cstyle: "display",
    结论: [
      - 对 a.e. $x : X$，$y mapsto f(x, y)$ 在 $Y$ 上 $cal(B)$-可测；
      - $x mapsto integral_Y f(x, y) dif nu(y)$ 在 $X$ 上 $cal(A)$-可测；
      - $integral_(X times Y) f dif (mu times.o nu) = integral_X (integral_Y f(x, y) dif nu(y)) dif mu(x) = integral_Y (integral_X f(x, y) dif mu(x)) dif nu(y)$。
    ],
  )
]

#定理条目("Fubini 定理", "Fubini's Theorem", uuid: "FubiniTheorem")[
  #定理子句(
    条件: ([~$f : X times Y -> EReal$ 是 $cal(A) times.o cal(B)$-可测], [$f in L^1 (X times Y, mu times.o nu)$ （即 $integral_(X times Y) |f| dif (mu times.o nu) < infinity$）]),
    cstyle: "display",
    结论: [
      - 对 a.e. $x : X$，$y mapsto f(x, y)$ 在 $Y$ 上 $L^1 (nu)$；
      - $x mapsto integral_Y f(x, y) dif nu(y)$ 在 $X$ 上 $L^1 (mu)$；
      - $integral_(X times Y) f dif (mu times.o nu) = integral_X (integral_Y f(x, y) dif nu(y)) dif mu(x) = integral_Y (integral_X f(x, y) dif mu(x)) dif nu(y)$。
    ],
  )
]

#注条目("", "")[
  Tonelli 处理非负可测函数（结论关于积分顺序对称且无可积性前提），Fubini 处理实值（或复值）可积函数（前提是 $|f|$ 关于乘积测度可积，通常先用 Tonelli 验证）。
]


// ============================================================
= $L^p$ 空间
// ============================================================

== $L^p$ 的定义

#约定[
  - $(X, cal(A), mu)$ 是#测度空间
  - $p : [1, infinity]$
  - $f, g : X -> EReal$ 是#函数Lebesgue可测
]

#定义条目("本性有界", "Essentially Bounded", uuid: "EssentiallyBounded")[
  #定义子句(
    主体: [$f$ 是#本性有界],
    isPredicate: true,
    内容: [$exists M >= 0$, $|f| <= M$ a.e. 在 $X$ 上],
  )
]

#定义条目("本性上确界", "Essential Supremum", uuid: "EssentialSupremum")[
  #定义子句(
    主体: [$f$ 的#本性上确界],
    内容: [$inf { M >= 0 | |f| <= M$ a.e. 在 $X$ 上 $}$, 取值于 $[0, infinity]$],
    记号: $"ess sup" |f|$,
  )
]

#定义条目($L^p$ + [ 空间], "L^p Space", uuid: "LpSpace")[
  #定义子句(
    主体: [#测度空间 $(X, cal(A), mu)$ 上的 $L^p$ 空间],
    bstyle: "display",
    内容: [
      - 当 $1 <= p < infinity$: $L^p (X, mu) := { f : X -> EReal | f$ 可测 $and integral_X |f|^p dif mu < infinity } slash tilde$，其中 $f tilde g iff f = g$ a.e.
      - 当 $p = infinity$: $L^infinity (X, mu) := { f : X -> EReal | f$ 可测 $and f$ #本性有界 $} slash tilde$。
      - $L^p$ 范数：$||f||_p := (integral_X |f|^p dif mu)^(1/p)$（$1 <= p < infinity$）；$||f||_infinity := "ess sup" |f|$。
    ],
    记号: $L^p (X, mu)$,
  )
]


== 经典不等式

#定理条目("Hölder 不等式", "Hölder's Inequality", uuid: "HoelderInequality")[
  #定理子句(
    cstyle: "display",
    条件: ([~$1 <= p, q <= infinity$], [$1/p + 1/q = 1$（共轭指标，约定 $1/infinity = 0$）]),
    结论: [$forall f in L^p, g in L^q, integral_X |f g| dif mu <= ||f||_p dot ||g||_q$],
  )
]

#定理条目("Minkowski 不等式", "Minkowski's Inequality", uuid: "MinkowskiInequality")[
  #定理子句(
    条件: ([~$1 <= p <= infinity$], [$f, g in L^p$]),
    结论: [$||f + g||_p <= ||f||_p + ||g||_p$],
  )
]


== $L^p$ 的完备性

#定理条目("Riesz–Fischer 定理", "Riesz–Fischer Theorem", uuid: "RieszFischerTheorem")[
  #定理子句(
    条件: ([~$1 <= p <= infinity$]),
    结论: [$L^p (X, mu)$ 是 Banach 空间（即按 $||dot||_p$ 完备）],
  )
]

#性质条目("$L^p$ 的可分性", "", uuid: "LpSeparability")[
  #定理子句(
    条件: ([~$(X, cal(A), mu)$ 是 $sigma$-有限的可分#测度空间]),
    cstyle: "display",
    结论: [
      - 当 $1 <= p < infinity$: $L^p (X, mu)$ 可分；
      - 当 $p = infinity$: $L^infinity (X, mu)$ 一般 *不* 可分，例如 $L^infinity ([0, 1], m)$。
    ],
  )
]

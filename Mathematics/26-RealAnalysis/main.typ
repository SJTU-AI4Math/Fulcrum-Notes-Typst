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
// 占位条目用 // TODO body 标注, 等猫猫对完教案再填

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
  // TODO: body 待猫猫对教案
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
  // TODO: 任意非负可测 f 都是一列单调上升简单函数的逐点极限 (猫猫填)
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
  // TODO: f_n -> f a.e. on D (猫猫填)
]

#定义条目("几乎一致收敛", "Almost Uniform Convergence", uuid: "AlmostUniformConvergence")[
  // TODO: ∀ε > 0, ∃E ⊂ D with m(E) < ε, f_n ⇉ f on D \ E (猫猫填)
]

#定义条目("依测度收敛", "Convergence in Measure", uuid: "ConvergenceInMeasure")[
  // TODO: ∀η > 0, m({x : |f_n(x) - f(x)| ≥ η}) → 0 (猫猫填)
]


== 三大经典定理

#定理条目("Egorov 定理", "Egorov's Theorem", uuid: "EgorovTheorem")[
  // TODO: 有限测度集上, a.e. 收敛 ⟹ 几乎一致收敛 (猫猫填)
]

#定理条目("Lusin 定理", "Lusin's Theorem", uuid: "LusinTheorem")[
  // TODO: Lebesgue 可测 ⟺ "几乎"连续 (∀ε ∃闭集 K, m(D \ K) < ε, f|K 连续) (猫猫填)
]

#定理条目("Riesz 定理", "Riesz's Theorem", uuid: "RieszTheorem")[
  // TODO: 依测度收敛 ⟹ 存在子列 a.e. 收敛 (猫猫填)
]

#性质条目("依测度收敛的相互关系", "", uuid: "ConvergenceComparison")[
  // TODO: a.e. ⟹ 测度 (有限测度集); 测度 ⟹ 子列 a.e.; 几乎一致 ⟹ a.e. + 测度 (猫猫填)
]


// ============================================================
= Lebesgue 积分
// ============================================================

== 简单函数的积分

#约定[
  - $D : Set(Real)$
  - $D #集合Lebesgue可测$
]

#定义条目("简单函数积分", "Simple Function Integral", uuid: "SimpleFunctionIntegral")[
  // TODO: ∫_D φ = Σ a_i · m(E_i), φ = Σ a_i · 1_{E_i} (猫猫填)
]

#性质条目("简单函数积分的线性 / 单调性", "", uuid: "SimpleFunctionIntegralProperties")[
  // TODO: linearity, monotonicity (猫猫填)
]


== 非负可测函数的积分

#定义条目("非负可测函数积分", "Nonnegative Measurable Integral", uuid: "NonnegativeMeasurableIntegral")[
  // TODO: ∫_D f = sup { ∫_D φ : 0 ≤ φ ≤ f, φ 简单 } (猫猫填)
]

#定理条目("Levi 单调收敛定理", "Monotone Convergence Theorem", uuid: "MonotoneConvergenceTheorem")[
  // TODO: 0 ≤ f_n ↑ f ⟹ ∫ f_n → ∫ f (猫猫填)
]

#引理条目("Fatou 引理", "Fatou's Lemma", uuid: "FatouLemma")[
  // TODO: ∫ liminf f_n ≤ liminf ∫ f_n (猫猫填)
]


== 一般可测函数的 Lebesgue 积分

#定义条目("Lebesgue 可积", "Lebesgue Integrable", uuid: "LebesgueIntegrable")[
  // TODO: ∫_D |f| < ∞ (猫猫填)
]

#定义条目("Lebesgue 积分", "Lebesgue Integral", uuid: "LebesgueIntegral")[
  // TODO: ∫ f = ∫ f^+ - ∫ f^- (猫猫填)
]

#定理条目("Lebesgue 控制收敛定理", "Dominated Convergence Theorem", uuid: "DominatedConvergenceTheorem")[
  // TODO: f_n → f a.e., |f_n| ≤ g 可积 ⟹ ∫ f_n → ∫ f (猫猫填)
]


== 与 Riemann 积分的关系

#定理条目("Riemann 可积 ⟹ Lebesgue 可积", "Riemann Integrable Implies Lebesgue Integrable", uuid: "RiemannImpliesLebesgue")[
  // TODO: 紧区间上 Riemann 可积 ⟹ Lebesgue 可积 + 两积分相等 (猫猫填)
]

#定理条目("Riemann 可积的 Lebesgue 刻画", "Lebesgue Characterization of Riemann Integrability", uuid: "LebesgueCharRiemann")[
  // TODO: 有界 f 在 [a,b] 上 Riemann 可积 ⟺ 不连续点集 Lebesgue 测度为 0 (猫猫填)
]


// ============================================================
= 微分与不定积分
// ============================================================

== Vitali 覆盖与单调函数的可微性

#定义条目("Vitali 覆盖", "Vitali Cover", uuid: "VitaliCover")[
  // TODO: E 的覆盖族 V: ∀x ∈ E ∀ε>0 ∃I ∈ V, x ∈ I, |I| < ε (猫猫填)
]

#引理条目("Vitali 覆盖引理", "Vitali Covering Lemma", uuid: "VitaliCoveringLemma")[
  // TODO: 有限外测度 + Vitali 覆盖 ⟹ 可取出有限不交子族任意逼近 (猫猫填)
]

#定理条目("Lebesgue 定理: 单调函数 a.e. 可微", "Lebesgue's Theorem on Differentiation of Monotone Functions", uuid: "MonotoneAlmostEverywhereDifferentiable")[
  // TODO: f: [a,b] -> R 单调 ⟹ f a.e. 可微, f' 可积, ∫_a^b f' ≤ f(b) - f(a) (猫猫填)
]


== 有界变差函数

#定义条目("全变差", "Total Variation", uuid: "TotalVariation")[
  // TODO: V_a^b(f) = sup Σ |f(x_i) - f(x_{i-1})| (猫猫填)
]

#定义条目("有界变差", "Bounded Variation", uuid: "BoundedVariation")[
  // TODO: V_a^b(f) < ∞ (猫猫填)
]

#定理条目("Jordan 分解", "Jordan Decomposition", uuid: "JordanDecomposition")[
  // TODO: BV ⟺ 两个单调递增函数之差 (猫猫填)
]


== 绝对连续与微积分基本定理

#定义条目("绝对连续", "Absolutely Continuous", uuid: "AbsolutelyContinuous")[
  // TODO: ∀ε ∃δ ∀{(a_i, b_i)} 不交且 Σ(b_i - a_i) < δ ⟹ Σ|f(b_i) - f(a_i)| < ε (猫猫填)
]

#定义条目("不定积分", "Indefinite Integral", uuid: "IndefiniteIntegral")[
  // TODO: F(x) = ∫_a^x f + C, f Lebesgue 可积 (猫猫填)
]

#性质条目("不定积分是绝对连续", "", uuid: "IndefiniteIntegralAbsolutelyContinuous")[
  // TODO: f 可积 ⟹ F 绝对连续 (猫猫填)
]

#定理条目("Lebesgue 微分定理", "Lebesgue Differentiation Theorem", uuid: "LebesgueDifferentiationTheorem")[
  // TODO: f 可积, F(x) = ∫_a^x f, 则 F'(x) = f(x) a.e. (猫猫填)
]

#定理条目("微积分基本定理 (Lebesgue 形式)", "Fundamental Theorem of Calculus (Lebesgue)", uuid: "FundamentalTheoremCalculusLebesgue")[
  // TODO: F 绝对连续 ⟺ F' 可积且 F(x) = F(a) + ∫_a^x F' (猫猫填)
]


// ============================================================
= 乘积测度与 Fubini 定理
// ============================================================

== 乘积可测结构

#约定[
  - $(X, cal(A), mu), (Y, cal(B), nu)$ 是#测度空间，且均为 $sigma$-有限
]

#定义条目("乘积 $sigma$-代数", "Product Sigma-Algebra", uuid: "ProductSigmaAlgebra")[
  // TODO: A ⊗ B = σ(A × B) (猫猫填)
]

#定义条目("截面", "Cross-Section", uuid: "CrossSection")[
  // TODO: E_x = { y : (x,y) ∈ E }, E^y = { x : (x,y) ∈ E } (猫猫填)
]

#定义条目("乘积测度", "Product Measure", uuid: "ProductMeasure")[
  // TODO: (μ × ν)(A × B) = μ(A) · ν(B), extending to A ⊗ B (猫猫填)
]


== Fubini 与 Tonelli 定理

#定理条目("Tonelli 定理", "Tonelli's Theorem", uuid: "TonelliTheorem")[
  // TODO: f ≥ 0 可测 ⟹ ∫∫ f d(μ×ν) = ∫(∫ f dν) dμ = ∫(∫ f dμ) dν (猫猫填)
]

#定理条目("Fubini 定理", "Fubini's Theorem", uuid: "FubiniTheorem")[
  // TODO: f ∈ L^1(μ×ν) ⟹ 同上, 两侧积分相等 (猫猫填)
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
  // TODO: ∃M, |f| ≤ M a.e. (猫猫填)
]

#定义条目("本性上确界", "Essential Supremum", uuid: "EssentialSupremum")[
  // TODO: ess sup f = inf { M : |f| ≤ M a.e. } (猫猫填)
]

#定义条目($L^p$ + [ 空间], "L^p Space", uuid: "LpSpace")[
  // TODO: L^p(X,μ) = { f 可测 : ∫ |f|^p < ∞ } / ~_{a.e.}; p = ∞ 用 ess sup (猫猫填)
]


== 经典不等式

#定理条目("Hölder 不等式", "Hölder's Inequality", uuid: "HoelderInequality")[
  // TODO: 1/p + 1/q = 1 ⟹ ∫|fg| ≤ ||f||_p · ||g||_q (猫猫填)
]

#定理条目("Minkowski 不等式", "Minkowski's Inequality", uuid: "MinkowskiInequality")[
  // TODO: ||f + g||_p ≤ ||f||_p + ||g||_p (猫猫填)
]


== $L^p$ 的完备性

#定理条目("Riesz–Fischer 定理", "Riesz–Fischer Theorem", uuid: "RieszFischerTheorem")[
  // TODO: L^p 是 Banach 空间 (1 ≤ p ≤ ∞) (猫猫填)
]

#性质条目("$L^p$ 的可分性", "", uuid: "LpSeparability")[
  // TODO: 1 ≤ p < ∞ ⟹ L^p 可分; p = ∞ 一般不可分 (猫猫填)
]

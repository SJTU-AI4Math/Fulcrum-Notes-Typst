#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../contributors.typ": *
#import "export.typ": *

#import "../08-BasicAlgebra/export.typ": *
#import "../15-LinearAlgebra/export.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../54-Topology/main.typ": *
#import "../28-MeasureTheory/export.typ": *
#import "../26-BasicAnalysis/export.typ": *

#show: FulcrumCN
#show: TypeStyle
#show: SetStyle
#show: AlgebraStyle
#show: MeasureTheoryStyle

#title([实分析])

= Lebesgue 可测函数

== 基本定义

#let 函数Lebesgue可测 = optionLink("LebesgueMeasurableFunction", [Lebesgue 可测])
#let 函数Lebesgue不可测 = optionLink("LebesgueMeasurableFunction", [Lebesgue 不可测])

#约定[
  - $D : Set(Real)$
  - $D 集合Lebesgue可测$
  - $f, g : D -> EReal$
]

#定义(
  uuid: "LebesgueMeasurableFunction",
  [Lebesgue 可测函数],
  [Lebesgue Measurable Function],
  [$f$ #函数Lebesgue可测],
  isPredicate: true,
  bstyle: "display",
  [$ forall c : EReal, #setOf($x$, $f(x) <= c$)#集合Lebesgue可测 $],
  contributors: (猫猫,)
)

#性质(
  uuid: "LebesgueMeasurableFunctionIff",
  [Lebesgue 可测函数的等价定义],
  "",
  hstyle: "display",
  hypotheses: (
    令($alpha$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) <= c$)#集合Lebesgue可测$]),
    令($beta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) < c$)#集合Lebesgue可测$]),
    令($gamma$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) >= c$)#集合Lebesgue可测$]),
    令($delta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) > c$)#集合Lebesgue可测$]),
    令($epsilon$, type: $Prop$, [$forall O : Set(EReal)$, $O$ 是开集 $implies f^(-1)(O) #集合Lebesgue可测$]),
    令($zeta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) = c$)#集合Lebesgue可测$])
  ),
  [$alpha iff beta iff gamma iff delta iff epsilon implies zeta$],
  contributors: (猫猫,)
)

#结构性质(
  uuid: "LebesgueMeasurableFunctionAlgebra",
  [Lebesgue 可测函数代数],
  "",
  [$#setOf($f$, type: $D -> EReal$, $f 函数Lebesgue可测$)$ 是#代数],
  members: (
    (name: "加法", value: $(f, g : D -> EReal) mapsto (x mapsto f(x) + g(x))$),
    (name: "数乘", value: $(k : Real, f : D -> EReal) mapsto (x mapsto k f(x))$),
    (name: "乘法", value: $(f, g : D -> EReal) mapsto (x mapsto f(x) dot g(x))$),
  ),
  contributors: (猫猫,)
)

#反例(
  uuid: "LebesgueMeasurableFunctionComposite",
  [Lebesgue 可测函数的复合不一定 Lebesgue 可测],
  "",
  contributors: (猫猫,)
)[
  $exists f, g: D -> EReal, f,g #函数Lebesgue可测 and g compose f #函数Lebesgue不可测$
]

#let 依测度等价 = optionLink(
  "LebesgueMeasureFunctionEquiv",
  [依测度等价],
)

#定义(
  uuid: "LebesgueMeasureFunctionEquiv",
  [依测度等价],
  "",
  isPredicate: true,
  [$f$, $g$ #依测度等价],
  [#几乎处处 $x mapsto (x in D implies f(x) = g(x))$],
  contributors: (猫猫,)
)

#结构性质(
  uuid: "LebesgueMeasureFunctionEquivEquivalence",
  [依测度等价是等价关系],
  "",
  [#依测度等价;是等价关系],
  contributors: (猫猫,)
)

#性质(
  uuid: "LebesgueMeasureFunctionEquivMeasurable",
  [函数的 Lebesgue 可测性沿依测度等价传递],
  "",
  hypotheses: (
    [ $f$, $g$ #依测度等价],
    [$f$ #函数Lebesgue可测],
  ),
  [$g$ #函数Lebesgue可测],
  contributors: (猫猫,)
)

#例(
  uuid: "ContinuousLebesgueMeasurable",
  [连续函数可测],
  "",
)[
  设 $f$ #实函数连续, 则 $f$ #函数Lebesgue可测。
]

#例(
  uuid: "MonotoneLebesgueMeasurable",
  [单调函数可测],
  "",
)[
  设 $f$ #单调, 则 $f$ #函数Lebesgue可测。
]

== 简单逼近定理

#约定[
  - $D : Set(Real)$
  - $D 集合Lebesgue可测$
  - $f : D -> EReal$
]

#let 简单 = optionLink(
  "SimpleFunction",
  [简单]
)

#定义(
  uuid: "SimpleFunction",
  [简单函数],
  [Simple Function],
  isPredicate: true,
  hypotheses: ([ $phi : D -> EReal$],),
  [$phi$ #简单],
  [ $phi 函数Lebesgue可测 and card(f(D)) < infinity$],
  contributors: (猫猫,)
)

#引理(
  uuid: "SimpleFunctionApproximation",
  [简单逼近引理],
  [Simple Approximation Lemma],
  hypotheses: ([ $f 函数Lebesgue可测$], $f 函数有界$, $epsilon : PReal$),
  [$
    exists phi, psi: D -> ENNReal, 
    #structProp(
      (name: "简单性", value: [$phi, psi #简单$]),
      (name: "控制性", value: [$forall x in D, phi(x) <= f(x) <= psi(x)$]),
      (name: "精确性", value: [$forall x in D, psi(x) - phi(x) <= epsilon$])
    )
  $],
  cstyle: "display",
  contributors: (猫猫,)
)

#证明[
  #目标(name: "简单函数构造",)[$exists phi, psi: D -> ENNReal, phi, psi #简单$]

  目标 1 （简单函数构造）：需构造 $phi, psi : D -> ENNReal$

  目标 2 （简单性）：需证： $phi, psi #简单$

  目标 3 （控制性）：需证： $forall x in D, phi(x) <= f(x) <= psi(x)$

  目标 4 （精确性）：需证： $forall x in D, psi(x) - phi(x) <= epsilon$
]
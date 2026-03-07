#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "export.typ": *

#import "../08-BasicAlgebra/export.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../54-Topology/main.typ": *
#import "../28-MeasureTheory/export.typ": *

#show: FulcrumCN
#show: TypeStyle
#show: SetStyle
#show: AlgebraStyle
#show: MeasureTheoryStyle

#title([实分析])

= Lebesgue 可测函数

== 基本定义

#let Lebesgue可测函数 = optionLink("LebesgueMeasurableFunction", [Lebesgue 可测函数])

#约定[
  - $D : Set(Real)$
  - $f : D -> Real$
]

#定义(
  uuid: "LebesgueMeasurableFunction",
  [Lebesgue 可测函数],
  [Lebesgue Measurable Function],
  [$f$ 是 #Lebesgue可测函数],
  isPredicate: true,
  bstyle: "display",
  [$ forall c : EReal, #setOf($x$, $f(x) <= c$)#集合Lebesgue可测 $]
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
    令($epsilon$, type: $Prop$, [$forall O : Set(EReal)$, $O$]),
    令($zeta$, type: $Prop$, [$forall c : EReal, #setOf($x$, $f(x) = c$)#集合Lebesgue可测$])
  ),
  [$alpha iff beta iff gamma iff delta implies epsilon$]
)


#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../08-BasicAlgebra/export.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../54-Topology/main.typ": *

#show: FulcrumCN
#show: TypeStyle
#show: SetStyle
#show: AlgebraStyle

#title([测度论])

= 集代数

== $sigma$-代数

#let Sigma代数 = optionLink("SigmaAlgebra", [$sigma$-代数])

#结构(
  uuid: "SigmaAlgebra",
  [$sigma$-代数],
  [$sigma$-Algebra],
  hypotheses: ([ $S : Type$],[$Sigma : Set((Set(S)))$]),
  [$(S, Sigma)$ 是 #Sigma代数],
  isPredicate: true,
  (
    (name: "包含全集", value: $S in Sigma$),
    (name: "对可数并封闭", value: $forall (X : Nat -> Sigma), (union.big_(n : Nat) X_n) in Sigma$),
    (name: "对补集封闭", value: $forall A in Sigma, complement A in Sigma$)
  )
)

#性质(
  uuid: "SigmaAlgebraInter",
  [$sigma$-代数可交],
  [$sigma$-Algebra Intersection],
  hypotheses: (
    [ $S: Type$],
    [$Sigma_1 : Set((Set(S)))$],
    [$Sigma_2 : Set((Set(S)))$],
    [$(S, Sigma_1), (S, Sigma_2)$ 是 #Sigma代数]
  ),
)[
  $(S, Sigma_1 inter Sigma_2)$ 是 #Sigma代数
]

#let Borel集族 = optionLink(
  "BorelSets",
  [Borel 集族],
)

#定义(
  uuid: "BorelSets",
  [Borel 集族],
  [Borel Sets],
  hypotheses: ([ $S : Type$], [$(S, cal(T))$ 是#拓扑空间]),
  [#Borel集族],
  bstyle: "display",
  [$ inter.big_(cal(T) subset.eq Sigma \ (S, Sigma) text("是") Sigma代数) Sigma $],
)

== 测度空间

#let 测度空间 = optionLink("MeasureSpace", [测度空间])
#let measure = (symbol) => optionLink("MeasureSpace", symbol)

#结构(
  uuid: "MeasureSpace",
  "测度空间",
  "Measure Space",
  hypotheses: ([ $S : Type$],),
  [$S$ 是#测度空间],
  (
    (name: "测度", varName: $mu$, value: $Set(S) -> ENNReal$),
    (name: "可数可加性", style: "display", value: $ forall (X : Nat -> Set(S)), X #两两;不交 implies #measure($mu$) (union.big_(n : Nat) X_n) = sum_(n : Nat) #measure($mu$) (X_n) $)
  )
)


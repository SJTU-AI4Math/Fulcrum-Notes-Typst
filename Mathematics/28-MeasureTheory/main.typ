#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "export.typ": *

#import "../08-BasicAlgebra/export.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../54-Topology/main.typ": *

#show: FulcrumCN
#show: TypeStyle
#show: SetStyle
#show: AlgebraStyle
#show: MeasureTheoryStyle

#title([测度论])

= 集代数

== 集合半环

#结构(
  uuid: "SetSemiRing",
  [集合半环],
  [Set Semi-Ring],
  hypotheses: ([ $S : Type$], [$cal(R) : Set((Set(S)))$]),
  [$cal(R)$ 是#集合半环],
  isPredicate: true,
  (
    (name: "包含空集", value: $emptyset in cal(R)$),
    (name: "对交封闭", value: $forall A, B in cal(R), A inter B in cal(R)$),
    (name: "差集可表示为有限并", style: "display", value: $ forall A, B in cal(R), exists (X : Nat -> cal(R)), X #两两;不交 and A backslash B = union.big_(n : Nat) X_n $)
  )
)

== $sigma$-代数

#结构(
  uuid: "SigmaAlgebra",
  [$sigma$-代数],
  [$sigma$-Algebra],
  hypotheses: ([ $S : Type$],[$Sigma : Set((Set(S)))$]),
  [$Sigma$ 是 #Sigma代数],
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
    [$Sigma_1, Sigma_2$ 是 #Sigma代数]
  ),
)[
  $Sigma_1 inter Sigma_2$ 是 #Sigma代数
]

#定义(
  uuid: "BorelSets",
  [Borel 集族],
  [Borel Sets],
  hypotheses: ([ $S : Type$], [$(S, cal(T))$ 是#拓扑空间]),
  [#Borel集族],
  bstyle: "display",
  [$ inter.big_(Sigma : Set((Set(S))) \ cal(T) subset.eq Sigma and Sigma text("是") Sigma代数) Sigma $],
  notation: [$Borel(S)$]
)

== 测度空间

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

#性质(
  uuid: "MeasureMonotonicity",
  "测度单调",
  "Measure Monotonicity",
  hypotheses: (
    [ $S : Type$],
    [$S$ 是#测度空间],
    [$A, B : Set(S)$],
    [$A subset.eq B$]
  ),
  [$measure(mu) (A) <= measure(mu) (B)$]
)

#定义(
  uuid: "MeasureRegularity",
  "正则性",
  "Regularity",
  hypotheses: (),
  [],
  []
)

== Borel 测度

#定义(
  uuid: "BorelMeasure",
  "Borel 测度",
  "Borel Measure",
  hypotheses: ([ $A : Set(Real)$],),
  [$A$ 的 #Borel测度],
  []
)


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
  [$Sigma$ 是#Sigma代数],
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
    [$Sigma_1, Sigma_2$ 是#Sigma代数]
  ),
)[
  $Sigma_1 inter Sigma_2$ 是#Sigma代数
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
  [$A$ 的#Borel测度],
  []
)


= 几乎处处量词

== 定义

#约定[
  - $(X, cal(A), mu)$ 是#测度空间
  - $P : X -> "Prop"$
]

#定义条目("几乎处处", "Almost Everywhere", uuid: "AlmostEverywhere")[
  #定义子句(
    主体: [#几乎处处 $x : X, P(x)$],
    isPredicate: true,
    内容: [#measure($mu$) ${ x : X | not P(x) } = 0$],
    记号: $"a.e." x : X, P(x)$,
  )
]

#注条目("", "")[
  - 「#几乎处处」不是某个特定谓词，而是一个*谓词转换器*：给定测度空间 $(X, cal(A), mu)$ 与谓词 $P : X -> "Prop"$，得到新命题#几乎处处 $x : X, P(x)$。
  - 在已固定测度空间的章节里，「#几乎处处」记号缩写为「a.e.」（来自 *almost everywhere*）。在概率论里同义记号常作 $"P-a.s."$（来自 *almost surely*）。
  - 集合 ${ x : X | not P(x) }$ 不必属于 $cal(A)$；多数文献要求它包含于一个零测可测集（即谓词「a.e. 真」的标准约定）。本笔记取宽义：只要存在 $N in cal(A)$ 满足#measure($mu$) $N = 0$ 且 $forall x in.not N, P(x)$ 即可。
]

== 基本性质

#性质条目("a.e. 蕴含 a.e.", "")[
  #定理子句(
    条件: ([~$P, Q : X -> "Prop"$], [$forall x : X, P(x) ==> Q(x)$], [#几乎处处 $x : X, P(x)$]),
    结论: [#几乎处处 $x : X, Q(x)$],
  )
]

#性质条目("a.e. 与逻辑联结词的相容性", "")[
  #定理子句(
    条件: ([~$P, Q : X -> "Prop"$]),
    cstyle: "display",
    结论: [
      - #几乎处处 $x : X, (P(x) and Q(x))$ #iff;(#几乎处处 $x : X, P(x)$) $and$ (#几乎处处 $x : X, Q(x)$)；
      - (#几乎处处 $x : X, P(x)$) $or$ (#几乎处处 $x : X, Q(x)$) $==>$ #几乎处处 $x : X, (P(x) or Q(x))$。反向一般不成立。
    ],
  )
]

#性质条目("a.e. 对可数族的封闭性", "")[
  #定理子句(
    条件: ([~$P_n : X -> "Prop", n : bb(N)$], [$forall n : bb(N), $ #几乎处处 $x : X, P_n (x)$]),
    结论: [#几乎处处 $x : X, forall n : bb(N), P_n (x)$],
  )
]


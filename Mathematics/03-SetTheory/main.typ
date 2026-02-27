#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "./export.typ"
#import "../03-TypeTheory/main.typ": *
#import "../06-OrderTheory/main.typ": *

#show: FulcrumCN
#hideRemark

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[集合论])
]

// 目录
#outline(title: "目录", indent: 2em)

// 3. 新开一页
#pagebreak()

= 集合论

#注[
  本章所述集合论为类型论元语言下的朴素集合论，而非 ZFC 或其他公理系统下的公理集合论。
]

#约定[#Type-decl($alpha$, Type)]

== 类型集合

#定义(
  uuid: "Set",
  "集合",
  "Sets over Types",
  [$alpha$ 上的集合],
  [ $alpha -> Prop$],
  notation: $Set(alpha)$,
)

#注[在集合元素所属的类型可从上下文中推断时，通常直接称为集合而不指明类型。]

#show math.in: optionLink("Set.mem", $in$, url: "https://zh.wikipedia.org/wiki/%E5%85%83%E7%B4%A0_(%E6%95%B8%E5%AD%B8)")

#定义(
  uuid: "Set.mem",
  "属于关系",
  "Membership",
  hypotheses: ([ $#Type-decl($x$, $alpha$)$, $#Type-decl($A$, $Set(alpha)$)$],),
  [$x$ 属于 $A$],
  isPredicate: true,
  [ $A(x)$],
)

#注[
  “$x in A$” 亦称作“$x$ 是 $A$ 的元素”，或“$A$ 包含 $x$”，又记作 $A in.rev x$。
]

#定义(
  uuid: "setOf",
  "谓词集合",
  "Set of Predicates",
  hypotheses: ([ $#Type-decl($P$, $A -> Prop$)$],),
  [由谓词 $P$ 构造的集合],
  [ $P$],
  notation: $setOf(x, type: A, P(x))$,
)

#注[
  - 在上下文中可以推理出集合所属的类型时，$setOf(x, type: A, P(x))$ 常简记作 $setOf(x, P(x))$。

  - 在类型集合语言下，谓词与集合事实上是同一回事。

  - 由于类型与其上的一个谓词亦可构造子类型，因此我们等同看待谓词集合与相应的子类型，即将类型上的集合等同视为其子类型。
]

== 集合之间的关系

#约定[#Type-decl($A, B$, Set($alpha$))]

#show math.subset.eq: optionLink("Set.subset", $subset.eq$, url: "TBD")

#定义(
  uuid: "Set.subset",
  "子集",
  "Subset",
  [$A$ 包含于 $B$],
  [ $forall x in A, x in B$],
  isPredicate: true,
  notation: $A subset.eq B$,
)

#show math.subset: optionLink("Set.subset.remark", $subset$, url: "TBD")
#show math.subset.eq.not: optionLink("Set.subset.remark", $subset.eq.not$, url: "TBD")
#show math.supset: optionLink("Set.subset.remark", $supset$, url: "TBD")
#show math.supset.eq: optionLink("Set.subset.remark", $supset.eq$, url: "TBD")
#show math.supset.eq.not: optionLink("Set.subset.remark", $supset.eq.not$, url: "TBD")

#注(uuid: "Set.subset.remark")[
  - “$A$ 包含于 $B$”亦称作“$A$ 是 $B$ 的子集”，或“$B$ 包含 $A$”，又记作 $B supset.eq A$。注意“包含”一词既可能指集合间关系、又可能指元素与集合间关系，应注意区分。

  - “$not (A subset.eq B)$” 简记为 $A subset.eq.not B$，类似地 $not (B supset.eq A)$ 简记为 $B supset.eq.not A$。

  - “$subset.eq$” 有时记作 “$subset$”，但后者有时也表示“真子集”，为避免歧义写作前者。
]

#结构性质(
  uuid: "Set.instSubsetPartialOrder",
  "集合在子集关系下有偏序结构",
  "",
  [集合类型上有#偏序结构],
  members: (
    (name: "二元关系", varName: $dot subset.eq dot$, value: $Set(alpha) -> Set(alpha) -> Prop$),
    (name: "自反性", value: $forall A : Set(alpha), A subset.eq A$),
    (name: "反对称性", value: $forall A, B : Set(alpha), (A subset.eq B and B subset.eq A) implies A = B$),
    (name: "传递性", value: $forall A, B, C : Set(alpha), (A subset.eq B and B subset.eq C) implies A subset.eq C$),
  )
)

#定义(
  uuid: "properSubset",
  "真子集",
  "Proper Subset",
  [$A$ 真包含于 $B$],
  [ $A subset.eq B and B subset.eq.not A$],
  isPredicate: true,
  notation: $A subset B$,
)

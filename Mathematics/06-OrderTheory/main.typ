#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "../03-TypeTheory/main.typ": *
#import "../03-SetTheory/main.typ": *

#show: FulcrumCN

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[序论])
]

// 目录
#outline(title: "目录", indent: 2em)

// 3. 新开一页
#pagebreak()

= 序

== 基本定义

本节约定：
+ $#Type-decl($T$, Type)$

#let 预序结构 = optionLink(
  "Preorder",
  [预序结构],
)
#结构(
  uuid: "Preorder",
  "预序结构",
  "Preorder",
  [$T$ 上的预序结构],
  (
    (name: [二元关系], varName: [$dot <= dot$], value: [$T -> T -> Prop$]),
    (name: [自反性], name_en: [Reflexivity], value: [$forall (x : T), x <= x$]),
    (name: [传递性], name_en: [Transitivity], value: [$forall (x, y, z : T), (x <= y and y <= z) implies x <= z$]),
  ),
)

#let 偏序结构 = optionLink(
  "PartialOrder",
  [偏序结构],
)
#结构(
  uuid: "PartialOrder",
  "偏序结构",
  "Partial Order",
  extends: ([ $T$ 上有#预序结构],),
  [$T$ 上的偏序结构],
  (
    (name: [反对称性], name_en: [Antisymmetry], value: [$forall (x, y : T), (x <= y and y <= x) implies x = y$]),
  ),
)

#定义(
  "严格偏序关系",
  "Strict Partial Order",
  hypotheses: ([ $T$ 上有#偏序结构], [#Type-decl($a,b$, $T$)]),
  [$a<b$],
  [ $a <= b and a != b$],
  isPremise: true,
)

#注("", "")[
  记号上，用 $a>=b$ 表示 $b<=a$，用 $a>b$ 表示 $b<a$。
]

#let 全序结构 = optionLink(
  "TotalOrder",
  [全序结构],
)

#let 上界 = optionLink(
  "UpperBound",
  [上界],
)
#let 下界 = optionLink(
  "LowerBound",
  [下界],
)

#定义(
  uuid: "UpperBound",
  "上界",
  "Upper Bound",
  hypotheses: ([ $T$ 上有#偏序结构], [#Type-decl($u$, $T$)], [#Type-decl($S$, $Set(T)$)]),
  [$u$ 是 $S$ 的上界],
  [ $forall (s : S), s <= u$],
  isPremise: true,
)
#定义(
  uuid: "LowerBound",
  "下界",
  "Lower Bound",
  hypotheses: ([#link(<UpperBound>, [同上])],),
  [$u$ 是 $S$ 的下界],
  [ $forall (s : S), u <= s$],
  isPremise: true,
  extention: true,
)
#定义(
  uuid: "BoundedAbove",
  "有上界",
  "Bounded Above",
  hypotheses: ([#link(<UpperBound>, [同上])],),
  [$S$ 有上界],
  [ $exists (u : T), u$ 是 $S$ 的#上界],
  isPremise: true,
  extention: true,
)
#定义(
  uuid: "BoundedBelow",
  "有下界",
  "Bounded Below",
  hypotheses: ([#link(<LowerBound>, [同上])],),
  [$S$ 有下界],
  [ $exists (u : T), u$ 是 $S$ 的#下界],
  isPremise: true,
  extention: true,
)
#定义(
  uuid: "Bounded",
  "有界",
  "Bounded",
  hypotheses: ([#link(<BoundedAbove>, [同上])],),
  [$S$ 有界],
  [ $S$ 有#上界$and S$有#下界],
  isPremise: true,
  extention: true,
)

#结构(
  uuid: "TotalOrder",
  "全序结构 / 线序结构",
  "Total Order / Linear Order",
  extends: ([ $T$ 上有#偏序结构],),
  [$T$ 上的全序结构],
  (
    (name: [全序性], value: [$forall (x, y : T), (x <= y) or (y <= x)$]),
  ),
)

#注("", "")[
  #全序结构;即允许任意两个元素进行比较的#偏序结构。
]

== 序范畴



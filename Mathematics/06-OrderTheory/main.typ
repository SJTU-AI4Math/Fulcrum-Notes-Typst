#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "../03-SetTheory/export.typ": *
#import "../03-TypeTheory/main.typ": *

#import "./export.typ": *

#show: FulcrumCN
#show: SetStyle

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

#约定[
  - $T : Type$
  - $(dot <= dot) : T -> T -> Prop$
]

#结构(
  uuid: "Preorder",
  "预序结构",
  "Preorder",
  isPredicate: true,
  [$(T, <=)$ 是#预序结构],
  (
    (name: [自反性], name_en: [Reflexivity], value: [$forall (x : T), x <= x$]),
    (name: [传递性], name_en: [Transitivity], value: [$forall (x, y, z : T), (x <= y and y <= z) implies x <= z$]),
  ),
)

#结构(
  uuid: "PartialOrder",
  "偏序结构",
  "Partial Order",
  extends: ([#预序结构],),
  [$(T, <=)$ 是#偏序结构],
  (
    (name: [反对称性], name_en: [Antisymmetry], value: [$forall (x, y : T), (x <= y and y <= x) implies x = y$]),
  ),
)

#注[#预序结构;中可能会出现一系列相互小于等于的元素，又它们关于传递性封闭，所以会产生一个序意义下的等价类，#偏序结构;的反对称性保证了所有这样等价类中的元素唯一。]

#定义(
  "严格偏序关系",
  "Strict Partial Order",
  hypotheses: ([ $(T, <=)$ 是#偏序结构], [#Type-decl($a,b$, $T$)]),
  [$a<b$],
  [ $a <= b and a != b$],
  isPredicate: true,
)

#注[
  记号上，用 $a>=b$ 表示 $b<=a$，用 $a>b$ 表示 $b<a$。
]

#定义(
  uuid: "UpperBound",
  "上界",
  "Upper Bound",
  hypotheses: ([ $(T, <=)$ 是#偏序结构], [#Type-decl($u$, $T$)], [#Type-decl($S$, $Set(T)$)]),
  [$u$ 是 $S$ 的上界],
  [$ forall (s : S), s <= u $],
  bstyle: "display",
  isPredicate: true,
)
#定义(
  uuid: "LowerBound",
  "下界",
  "Lower Bound",
  hypotheses: ([#link(<UpperBound>, [同上])],),
  [$u$ 是 $S$ 的下界],
  [ $forall (s : S), u <= s$],
  isPredicate: true,
  extention: true,
)
#定义(
  uuid: "BoundedAbove",
  "有上界",
  "Bounded Above",
  hypotheses: ([#link(<UpperBound>, [同上])],),
  [$S$ 有上界],
  [ $exists (u : T), u$ 是 $S$ 的#上界],
  isPredicate: true,
  extention: true,
)
#定义(
  uuid: "BoundedBelow",
  "有下界",
  "Bounded Below",
  hypotheses: ([#link(<LowerBound>, [同上])],),
  [$S$ 有下界],
  [ $exists (u : T), u$ 是 $S$ 的#下界],
  isPredicate: true,
  extention: true,
)
#定义(
  uuid: "Bounded",
  "有界",
  "Bounded",
  hypotheses: ([#link(<BoundedAbove>, [同上])],),
  [$S$ 有界],
  [ $S$ 有#上界 $and S$ 有#下界],
  isPredicate: true,
  extention: true,
)

#let 滤过序结构 = optionLink(
  "FilteredOrder",
  [滤过序结构],
)

#let 非空 = optionLink(
  "Inhabited",
  [非空],
)

#结构(
  uuid: "FilteredOrder",
  "滤过序结构",
  "Filtered Order",
  hypotheses: ([ $T$ #非空],),
  extends: ([#偏序结构],),
  [$(T, <=)$ 是#滤过序结构],
  (
    (name: [滤过性], value: [$forall (x, y : T), {x,y}$ 有上界]),
  ),
)

#注[
  #滤过序结构;即任意两个元素都有公共上界的#偏序结构。
]

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

#注[
  #全序结构;即允许任意两个元素进行比较的#偏序结构。
]

#let 良序结构 = optionLink(
  "WellOrder",
  [良序结构],
)

#结构(
  uuid: "WellOrder",
  "良序结构",
  "Well Order",
  extends: ([ $T$ 上有#全序结构],),
  [$T$ 上的#良序结构],
  (
    (name: [良序性], value: [$forall S : Set(T), S != emptyset implies S$ 有极小值]),
  ),
)

== 序范畴


= 滤子

#约定[
  - $alpha : Type$
  - $cal(F), cal(G) : Set((Set(alpha)))$
]

== 基本定义

#let 滤子 = optionLink(
  "Filter",
  [滤子],
)

#let univ = (type) => [$cal(U)_type$]

#结构(
  uuid: "Filter",
  "滤子",
  "Filter",
  isPredicate: true,
  [$cal(F)$ 是#滤子],
  (
    (name: [包含全集], value: [$univ(alpha) in cal(F)$]),
    (name: [超集封闭], value: [$forall (x, y : Set(alpha)), (x in cal(F) and x subset.eq y) implies y in cal(F)$]),
    (name: [交封闭], value: [$forall (x, y : Set(alpha)), x, y in cal(F) implies x inter y in cal(F)$]),
  ),
)

#注[]

#let 主滤子 = optionLink(
  "PrincipalFilter",
  [主滤子],
)

#let PFilter = (S) => $#optionLink(
  "PrincipalFilter", $cal(P)$
) (S)$

#定义(
  uuid: "PrincipalFilter",
  "主滤子",
  "Principal Filter",
  hypotheses: ([ $S : Set(alpha)$],),
  [$S$ 的#主滤子],
  [ $#setOf($X$, type: $Set(alpha)$, [ $S subset.eq X$ ]) $],
  notation: [$PFilter(S)$]
)

#let 滤子核 = optionLink(
  "FilterKernel",
  [滤子核],
)

#定义(
  uuid: "FilterKernel",
  "滤子核",
  "Filter Kernel",
  hypotheses: ([ $cal(F)$ 是#滤子],),
  [$cal(F)$ 的#滤子核],
  [ $inter.big cal(F)$],
)

#性质(
  uuid: "PrincipalFilterLegal",
  "主滤子是合法滤子","",
  hypotheses: ([ $S : Set(alpha)$],),
  [$PFilter(S)$ 是#滤子],
  extention: true
)

#let 单子 = optionLink(
  "monad",
  [单子],
)

#定义(
  uuid: "FilterJoin",
  "滤子并",
  "Filter Join",
  hypotheses: ([ $cal(F), cal(G)$ 是#滤子],),
  [$cal(F)$ 和 $cal(G)$ 的滤子并],
  [TBD],
)

#注[#滤子;事实上是一个#单子;；但我并没有理解这个 Flatten 函数的具体定义。]

#定义(
  uuid: "FilterOrder",
  "滤子偏序",
  "",
  hypotheses: ([ $cal(F), cal(G)$ 是#滤子],),
  [$cal(F) <= cal(G)$],
  isPredicate: true,
  [ $cal(F) subset.eq cal(G)$],
)

#结构性质(
  uuid: "instPartialOrderFilter",
  "滤子偏序是合法偏序",
  "",
  [$(alpha text("上的")#滤子, <=)$ 是#偏序结构],
)
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "../03-TypeTheory/main.typ": *

#show: FulcrumCN

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[集合论])
]

// 目录
#outline(title: "目录", indent: 2em)

// 3. 新开一页
#pagebreak()

= 集合论

== 类型集合

#let Set = type => [
  #optionLink(
    "Set",
    $op("Set")$,
    url: "https://zh.wikipedia.org/wiki/%E9%9B%86%E5%90%88_(%E6%95%B0%E5%AD%A6)",
  )#h(0.2em)#type
]

#定义(
  uuid: "Set",
  "类型集合",
  "Sets over Types",
  hypotheses: (
    [ $#Type-decl($A$, Type)$],
  ),
  [$A$ 上的集合类型],
  [ $A -> Prop$],
  notation: Set($A$),
)

#let setOf = (name, type: [], body) => [
  #optionLink("setOf", $\{$)#name#if (type != []) [ $:#type$]#optionLink("setOf", [ $|$ ])#body#optionLink(
    "setOf",
    $\}$,
  )
]
#定义(
  uuid: "setOf",
  "谓词构造的集合",
  "Set of Predicates",
  hypotheses: (
    [ $#Type-decl($A$, Type)$],
    [$#Type-decl($P$, $A -> Prop$)$],
  ),
  hstyle: "display",
  [由谓词 $P$ 构造的集合],
  [ $P$],
  notation: setOf($x$, type: $A$, $P(x)$),
)

#import "../../Fulcrum-Template-Typst/FulcrumCN.typ": *

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

#let Type = optionLink("Type", [$op("Type")$], url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA")
#let Type-decl = (
  obj,
  type,
) => [$obj #optionLink("Type.decl", $:$, url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA") type$]
#let def-CN = (declList, target, body, notation) => [设 #declList, 定义 *#target* 为 #body, 记作 #notation.]

#let Set = type => [#optionLink(
    "Set",
    $op("Set")$,
    url: "https://zh.wikipedia.org/wiki/%E9%9B%86%E5%90%88_(%E6%95%B0%E5%AD%A6)",
  )#h(0.2em)#type]

#dfn(
  uuid: "Set",
  "类型集合",
  "Sets over Types",
  [
    #def-CN(
      Type-decl($A$, Type),
      [$A$ 上的集合类型],
      $A -> Type$,
      Set($A$),
    )
  ],
)

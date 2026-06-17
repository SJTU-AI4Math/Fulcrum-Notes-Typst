#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "./export.typ": *
#import "../03-TypeTheory/export.typ": *

#show: FulcrumCN
#hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2em)[初等数论])
]

#outline(title: "目录", indent: 2em)

#pagebreak()

= 整数

== 素数与整除

#定义条目("素数", "Prime", uuid: "Prime")[
  #定义子句(
    条件: ([~$p : #Nat$]),
    主体: [$p$ 是 #素数],
    isPredicate: true,
    内容: [$p >= 2$, 且 $p$ 的正因子只有 $1$ 与 $p$ 自身],
  )
]

#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "./export.typ": *
#import "../03-TypeTheory/export.typ": *

#show: FulcrumCN
#show: LogicStyle
#hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2em)[逻辑])
]

#outline(title: "目录", indent: 2em)

#pagebreak()

= 命题逻辑

#约定[
  - $P, Q, R : #Prop$
]


== 逻辑算子

#定义条目("合取 / 与", "Conjunction / And", uuid: "And")[
  #定义子句(
    主体: [$P and Q$],
    内容: [$P$ #与 $Q$ 同时成立],
  )
]

#定义条目("析取 / 或", "Disjunction / Or", uuid: "Or")[
  #定义子句(
    主体: [$P or Q$],
    内容: [$P$ #与 $Q$ 至少一个成立],
  )
]

#定义条目("否定 / 非", "Negation / Not", uuid: "Not")[
  #定义子句(
    主体: [$not P$],
    内容: [$P$ 不成立],
  )
]

#定义条目("蕴含", "Implication", uuid: "Implies")[
  #定义子句(
    主体: [$P #implies Q$],
    内容: [若 $P$ 成立, 则 $Q$ 成立],
  )
]

#定义条目("等价", "Equivalence", uuid: "Iff")[
  #定义子句(
    主体: [$P #iff Q$],
    内容: [$P$ #与 $Q$ 互相蕴含],
  )
]

#注条目("", "")[
  对于合取 $P and Q$, 在 CNL 散文中除"$P$ #与 $Q$"的内联写法外, 当成立条件较多时, 推荐使用#结构合取 风格分条列出, 例如:
  $ #结构合取(
    ([交换性], $forall x y, x dot y = y dot x$),
    ([结合性], $forall x y z, (x dot y) dot z = x dot (y dot z)$),
  ) $
]

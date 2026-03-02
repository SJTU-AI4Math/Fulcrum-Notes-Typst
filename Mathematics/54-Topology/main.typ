/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* set theory */
#import "../03-SetTheory/export.typ": *
#import "../03-TypeTheory/main.typ": *

#show: FulcrumCN

// #hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2em)[拓扑学基础])
]

#outline(title: "Contents", indent: 2em)

#pagebreak()

= 拓扑空间基础

== 基本概念

#结构(
  uuid: "Topology",
  "拓扑",
  "Topology",
  isPredicate: true,
  [集合 $S: Set(alpha)$ 的幂集 $Set(Set(alpha))$ 的子集 $tau$ 是 $S$ 上的一个#topology],
  (
    (name: [包含全集和空集], name_en: [includes universal set and empty set], value: [$S in tau$, $emptyset in tau$]),
    (
      name: [对任意并封闭],
      name_en: [closed under arbitrary unions],
      value: [$forall (A : Set(tau)), A subset.eq tau arrow.double union.big A in tau$],
    ),
    (
      name: [对有限交封闭],
      name_en: [closed under finite intersections],
      value: [$forall (A, B : Set(tau)), A subset.eq tau and B subset.eq tau arrow A inter B in tau$],
    ),
  ),
)

#结构(
  uuid: "TopologicalSpace",
  "拓扑空间",
  "Topological Space",
  isPredicate: false,
  [集合上的拓扑空间],
  (
    (name: [集合 $S$], value: [$S$ 是一个集合]),
    (name: [拓扑 $tau$], value: [$tau$ 是 $S$ 上的一个#topology]),
  ),
)

#注[拓扑空间使用 $(S, tau)$ 来表示, 其中 $S$ 是一个集合，$tau$ 是 $S$ 上的一个拓扑, 这时称 $(S,tau)$ 是拓扑空间, 也称 $S$ 是装备了拓扑 $tau$ 的拓扑空间.]

#注[拓扑空间是刻画集合中元素间“亲疏”关系的结构. ]

#定义(
  uuid: "OpenSet",
  "开集",
  "Open Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$U subset.eq S$]),
  [$U$ 是 $S$ 的一个 #openSet],
)[$U in tau$]

#定义(
  uuid: "ClosedSet",
  "闭集",
  "Closed Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$U subset.eq S$]),
  [$U$ 是 $S$ 的一个 #closedSet],
)[$S without U in tau$]

#注[对于集合上的拓扑空间, 只需指定一个幂集上的一元谓词来定义什么是开集.]
#注[#openSet 和 #closedSet 是对称的. 我们也可以使用闭集定义拓扑. ]
#注[#openSet 和 #closedSet 是相对的概念, 但并不完全对立. 例如在离散拓扑中, 每个子集既是开集又是闭集.]

#定义(
  uuid: "Neighborhood",
  "邻域",
  "Neighborhood",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$x in S$], [$U subset.eq S$]),
  [$U$ 是 $x$ 的一个 #neighborhood],
)[
  $exists (O subset.eq S), O in tau and x in O and O subset.eq U$,
]

#定义(
  uuid: "NeighborhoodFamily",
  "邻域系 / 邻域族",
  "Neighborhood Family",
  isPredicate: false,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$x in S$]),
  [点 $x$ 的邻域系 / 邻域族],
)[
  $ { N : Set(alpha), N "是" x "的邻域" } $
  用 $Nbr(x) = { N in tau | x in N }$ 表示.
]

#注[邻域是一个点的“安全区”, 即该点可以在自身周围自由活动而保持在某个开集之内. ]

#定义(
  uuid: "Interior",
  "内部",
  "Interior",
  isPredicate: false,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$]),
  [集合 $A$ 的内部],
)[
  $ union.big #h(0.3em) { O in tau | O subset.eq A } $
  用 $Interior(A)$ 或 $A^o$ 表示.
]

#注[集合的内部是集合的“最大”开子集, 即包含于该集合的所有开集 的并. ]



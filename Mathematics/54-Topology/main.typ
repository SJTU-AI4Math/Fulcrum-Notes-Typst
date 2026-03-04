/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* set theory */
#import "../03-SetTheory/export.typ": *
#import "../03-TypeTheory/main.typ": *

#show: FulcrumCN

// #hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2em)[点集拓扑])
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
#注[#openSet;和#closedSet;是对称的. 我们也可以使用闭集定义拓扑. ]
#注[#openSet;和#closedSet;是相对的概念, 但并不完全对立. 例如在离散拓扑中, 每个子集既是开集又是闭集.]

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
  notation: [$Nbr(x)$],
  [点 $x$ 的邻域系 / 邻域族],
)[
  $ { N : Set(alpha), N in tau | x in N } $
]

#注[邻域是一个点的“安全区”, 即该点可以在自身周围自由活动而保持在某个开集之内. ]

#定义(
  uuid: "Interior",
  "内部",
  "Interior",
  isPredicate: false,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$]),
  notation: [$Interior(A)$ / $A^o$],
  [集合 $A$ 的内部],
)[
  $ union.big #h(0.3em) { O in tau | O subset.eq A } $
]

#注[集合的内部是集合的“最大”开子集, 即包含于该集合的所有开集 的并. ]

#性质(
  uuid: "InteriorPoint",
  "内部点",
  "Interior Point",
  hypotheses: ([$(S,tau)$ 是#ts], [$E:Set(alpha) subset.eq S$, $x:alpha in E$]),
)[
  $ x in Interior(E) arrow.l.r.double E in Nbr(x) $
]

#性质(
  "集合是开集当且仅当其内部是自身",
  "A set is open if and only if its interior is itself",
)[
  $ A in tau arrow.l.r.double A = Interior(A) $
]

#定义(
  uuid: "Closure",
  "闭包",
  "Closure",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  notation: [$Closure(A)$ / $overline(A)$],
  [集合 $A$ 的闭包],
)[
  $ inter.big #h(0.3em) { F subset.eq S | F "是闭集" and A subset.eq F } $
]

#性质(
  "集合的闭包是闭集",
  "The closure of a set is closed",
)[
  $Closure(A)$ 是闭集.
]

#性质(
  "集合是闭集当且仅当其闭包是自身",
  "A set is closed if and only if its closure is itself",
  bstyle: "display",
)[
  $ A "是闭集" arrow.l.r.double A = Closure(A) $
]

#定义(
  uuid: "ClosurePoint",
  "闭包点",
  "Closure Point",
  isPredicate: true,
  bstyle: "display",
  hypotheses: ([$(S,tau)$ 是#ts], [$E:Set(alpha) subset.eq S$, $x:alpha in S$]),
  [点 $x$ 是集合 $E$ 的一个闭包点],
)[
  $ x in Closure(E) arrow.l.r.double forall U in Nbr(x), U inter E eq.not emptyset $
]

#定义(
  uuid: "Boundary",
  "边界",
  "Boundary",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  notation: [$partial A$],
  [集合 $A$ 的边界],
)[
  $Closure(A) without Interior(A)$
]

== 拓扑空间的构造

#结构(
  uuid: "GeneratedTopology",
  "生成拓扑",
  "Generated Topology",
  isPredicate: true,
  hypotheses: ([$S: Set(alpha)$, $cal(B): Set(Set(alpha))$],),
  [由集合 $cal(B)$ 生成的拓扑],
  (
    (name: [覆盖性], value: [$union.big cal(B) = S$]),
    (
      name: [生成性],
      value: [$B_1, B_2 in cal(B), B_1 inter B_2 eq.not emptyset implies exists B_3 in cal(B), B_3 subset.eq B_1 inter B_2 and B_3 eq.not emptyset$],
    ),
  ),
)

#定义(
  uuid: "TopologicalBasis",
  "拓扑基",
  "Topological Basis",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#ts], [$cal(B):Set(alpha) subset.eq tau$]),
  [集合 $cal(B)$ 是拓扑 $tau$ 的一个拓扑基],
)[
  $tau$ 是由 $cal(B)$ 生成的拓扑, 即 $forall U in tau$, $U$ 可以表示为 $U = union.big { B in cal(B) | B subset.eq U }$.
]

#注[
  拓扑空间的拓扑基不唯一.
]

#定义(
  uuid: "SubspaceTopology",
  "子空间拓扑",
  "Subspace Topology",
  isPredicate: false,
  hypotheses: ([$(S,tau)$ 是#ts], [$X subset.eq S$]),
  bstyle: "display",
  [集合 $X$ 上的子空间拓扑],
)[
  $ tau_X = { U inter X | U in tau } $
]

#注[
  由子集诱导的子空间拓扑是从原拓扑中以该子集为边界“截取”出来的. 所以, 子空间拓扑中的#openSet/#closedSet;不一定是原拓扑中的#openSet/#closedSet.
]

#定义(
  uuid: "ProductTopology",
  "积拓扑",
  "Product Topology",
  isPredicate: false,
  hypotheses: ([$(X,tau_X), (Y, tau_Y)$ 是#ts],),
  [$X$ 和 $Y$ 的积拓扑],
)[
  $
    tau = { U subset.eq X times Y | forall (x,y) in U, exists U_x in tau_X, U_y in tau_Y, (x,y) in U_x times U_y subset.eq U }
  $
  定义 $(X times Y, tau)$ 为 $X$ 和 $Y$ 的*积拓扑空间*.
]

== 极限

#定义(
  uuid: "DeletedNeighborhood",
  "去心邻域",
  "Deleted Neighborhood",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$x in S$], [$U subset.eq S$]),
  [$U: Set(alpha)$ 是点 $x: S$ 的一个去心邻域],
)[
  $U union {x} in Nbr(x) and x in.not U$
]

#定义(
  uuid: "LimitPoint",
  "极限点 / 聚点",
  "Limit Point / Accumulation Point",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$], [$x in S$]),
  [点 $x$ 是集合 $A$ 的一个#limitPoint],
)[
  $forall U subset.eq S$, $U$ 是 $x$ 的一个去心邻域 $arrow U inter A eq.not emptyset$
]

#定义(
  uuid: "DerivedSet",
  "导集",
  "Derived Set",
  isPredicate: false,
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  notation: [$A'$],
  bstyle: "display",
  [集合 $A$ 的导集],
)[
  全体极限点的集合 $ { x in S | x "是 A 的一个极限点" } $
]

#定义(
  uuid: "IsolatedPoint",
  "孤立点",
  "Isolated Point",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$], [$x in S$]),
  [点 $x$ 是集合 $A$ 的一个孤立点],
)[$x in A and x not in A'$]

#性质(
  "导集与闭包的关系",
  "The relationship between derived set and closure",
  hypotheses: ([$(S,tau)$ 是#ts], [$E subset.eq S$]),
)[$E union E' = Closure(E)$.]

#性质(
  "闭集的等价定义",
  "Equivalent definition of closed sets",
  hypotheses: ([$(S,tau)$ 是#ts], [$E subset.eq S$]),
)[
  $E$ 是闭集当且仅当 $E$ 包含了它的所有极限点, 即 $E' subset.eq E$.
]

#定义(
  uuid: "DenseSet",
  "稠密集",
  "Dense Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个#denseForSet],
)[$Closure(A) = S$.]

#注[
  谈论稠密集可以在某个拓扑子空间 $X$ 中进行. 这时我们称集合 $A$ 在 $X$ 中稠密, 即 $A$ 在 $X$ 的闭包是 $X$ 本身, 即 $Closure_X(A) = X$.
]

#定义(
  uuid: "NowhereDense",
  "稀疏集 / 无处稠密集",
  "Nowhere Dense Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个稀疏集 / 无处稠密集],
)[
  $Interior(Closure(A)) = emptyset$.
]

#定义(
  uuid: "SelfDense",
  "自稠密集",
  "Self-Dense Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个自稠密集],
)[$A$ 的导集包含了 $A$ 本身, 即 $A subset.eq A'$.]

#定义(
  uuid: "PerfectSet",
  "完美集",
  "Perfect Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个完美集],
)[$A' = A$]

#注[
  完美集是一个没有孤立点的闭集. 例如在实数轴上, Cantor 集合就是一个完美集.
]

#定义(
  uuid: "SeqLimit",
  "序列的极限",
  "Limit of Sequence",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$x_n: Nat -> S$], [$x: S$]),
  notation: [$lim_(n arrow infinity) x_n = x$],
  [点 $x$ 是序列 $x_n$ 的一个极限],
)[
  $forall U subset.eq S$, $U in Nbr(x) arrow exists N in Nat, forall n in Nat, n > N arrow x_n in U$.
]

#定义(
  uuid: "SeqConvergence",
  "序列的收敛",
  "Convergence of Sequence",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#ts], [$x_n: Nat -> S$], [$x: S$]),
  notation: [$x_n arrow x$],
  [序列 $x_n$ 收敛于点 $x$],
)[
  $x$ 是序列 $x_n$ 的一个极限.
]

#注[
  谈论序列是否收敛需要在拓扑空间中进行. 即选取的拓扑不同, 序列的收敛情况也可能不同. 例如在离散拓扑中, 每个序列都收敛于每个点.
]

#定义(
  uuid: "SequentialCompactness",
  "序列紧性",
  "Sequential Compactness",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#ts], [$x_n: Nat arrow S$]),
  [序列 $x_n$ 具有#序列紧;性],
)[
  序列 $x_n$ 有#convergentForSeq;子列. 即 $exists p:Nat arrow Nat, x_(p(n)) subset.eq x_n$, $x_(p(n)) arrow x$.
]

#注[#序列紧;性简称为*列紧性*. 在函数空间中又叫*正规性*.]

== 连通性

#定义(
  uuid: "Connectedness",
  "连通性",
  "Connectedness",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  [集合 $A$ 是一个连通集合],
)[
  $A$ 不能表示为 $A = U union V$ 的形式, 其中 $U$ 和 $V$ 是 $A$ 的两个不交的非平凡开子集, 即
  $exists.not U subset.neq A, V subset.neq A$, $U$ 和 $V$ 是 $A$ 的开集, $U inter V eq emptyset$, $U eq.not emptyset$, $V eq.not emptyset and A = U union V$.
]

#定义(
  uuid: "PathConnectedness",
  "道路连通",
  "Path Connectedness",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  [集合 $A$ 是一个道路连通的集合],
)[
  $forall x, y in A$, $exists f: [0,1] arrow A$, $f(0) = x$, $f(1) = y$, $f:C([0,1])$.
]

#性质(
  "道路连通蕴含连通",
  "Path connectedness implies connectedness",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
)[$A$ 是#pathConnected $==>$ $A$ 是#connected]

#例(
  "连通不蕴含道路连通",
  "Connectedness does not imply path connectedness",
)[
  考虑 $bb(R)^2$ 上的集合
  $ A = { (x, y) in bb(R)^2 | y = sin(frac(1, x)) forall x > 0 }union { (0, y) in bb(R)^2 | y in [-1, 1] } $
  则 $A$ 是连通的但不是道路连通的.
]

== 紧致性

#定义(
  uuid: "OpenCover",
  "开覆盖",
  "Open Cover",
  isPredicate: true,
  bstyle: "display",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$], [$C: Set(Set(S))$]),
  [集合族 $C$ 是集合 $A$ 的一个开覆盖],
)[
  $forall U in C$, $U in tau$,
  $ A subset.eq union.big U $
]

#定义(
  uuid: "Compactness",
  "紧致性",
  "Compactness",
  isPredicate: true,
  bstyle: "display",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  [集合 $A$ 是一个#compact;集],
)[
  $forall C$, $C$ 是 $A$ 的一个开覆盖 $arrow.double$ $exists F subset.eq C$, $F$ 是 $A$ 的一个有限的子开覆盖.
  #linebreak()
  即: 任意开覆盖都有有限子覆盖.
]

#注[
  #compact;性又叫紧性, 又被称为 *Heine-Borel 性质*.
]

#例(
  "实数上的开区间不是紧致集",
  "The open interval in real numbers is not compact",
)[
  在实数轴上, 区间 $(0,1)$ 不是紧集. 这是因为 $(0,1)$ 的开覆盖 $\{ (frac(1, n),1) | n in Nat and n > 1 \}$ 没有有限子覆盖.
]

#性质(
  "紧致集的闭子集也是紧致的",
  "Closed subsets of compact sets are compact",
  hypotheses: ([$(S,tau)$ 是#ts], [$K subset.eq S$ #compact]),
)[$forall C subset.eq K$, $C$ 是#closedSet $arrow$ $C$ #compact]

#性质(
  "紧致性的绝对性",
  "Absoluteness of compactness",
  hypotheses: ([$(S,tau)$ 是#ts], [$(X,tau_X)$ 是 $S$ 的一个拓扑子空间], [$K subset.eq X$]),
)[$K$ 在 $X$ 中#compact; $arrow.l.r.double$ $K$ 在 $S$ 中#compact;]

#定义(
  uuid: "CountableCompactness",
  "可数紧性",
  "Countable Compactness",
  isPredicate: true,
  bstyle: "display",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$]),
  [集合 $A$ 具有#可数紧;性],
)[
  $forall C$, $C$ 是 $A$ 的一个可数的开覆盖 $arrow.double$ $exists F subset.eq C$, $F$ 是 $A$ 的一个有限的子开覆盖.
  #linebreak()
  即: 任意可数开覆盖都有有限子覆盖.
]

#注[
  在一般的#ts;中, 紧致性、可数紧性、序列紧性三者是完全不同的性质. 具体而言有以下的关系:
]

#性质(
  "紧致性蕴含可数紧性",
  "Compactness implies countable compactness",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$ #compact]),
)[
  $A$ #可数紧.
]

#性质(
  "序列紧性蕴含可数紧性",
  "Sequential compactness implies countable compactness",
  hypotheses: ([$(S,tau)$ 是#ts], [$A subset.eq S$ #序列紧]),
)[$A$ #可数紧.]

#例(
  "紧性不蕴含序列紧性",
  "Compactness does not imply sequential compactness",
)[
  考虑 Tychonoff 空间
  $ product_(i in I) X_i $
  $I$ 是索引集. 其中每个 $X_i$ 是#compact;的, 则其积空间是紧致的. 但当 $I$ 是不可数集时, 它不是#序列紧;的.
]

#例(
  "序列紧性不蕴含紧性",
  "Sequential compactness does not imply compactness",
)[
  考虑第一个不可数序数 $omega_1$ 上的序数拓扑 $[0,omega_1)$, 则它是#序列紧;的, 但不是#compact;的. 取开覆盖
  $ { [0, alpha) | alpha < omega_1 } $
  则它没有有限子覆盖.
]

#注[
  在度量空间中, #compact;、#可数紧;、#序列紧;三者是等价的.
]

#定理(
  uuid: "HeineBorel",
  "Heine-Borel 定理",
  "Heine-Borel theorem",
)[
  设 $E subset.eq bb(R)^n$, 则以下三种性质等价:
  #linebreak()
  (1) $E$ #compact;;
  (2) $E$ #序列紧;;
  (3) $E$ #可数紧;;
  (4) $E$ 是#closedSet;且有界的.
]

#例(
  "一般拓扑空间中的有界闭集不一定是紧致集",
  "A closed and bounded set in topological space is not necessarily compact",
)[]


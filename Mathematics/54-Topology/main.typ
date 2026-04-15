/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* set theory */
#import "../03-SetTheory/export.typ": *
#import "../03-TypeTheory/main.typ": *
#import "../06-OrderTheory/export.typ": *

#show: FulcrumCN

// #hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2em)[点集拓扑])
]

#align(center)[
  #block(text(weight: "bold", size: 1em)[Point-Set Topology])
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
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$U subset.eq S$]),
  [$U$ 是 $S$ 的一个#开集],
)[$U in tau$]

#定义(
  uuid: "ClosedSet",
  "闭集",
  "Closed Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$U subset.eq S$]),
  [$U$ 是 $S$ 的一个 #闭集],
)[$S without U in tau$]

#注[对于集合上的拓扑空间, 只需指定一个幂集上的一元谓词来定义什么是开集. #linebreak()
  #开集;和#闭集;是对称的. 我们也可以使用闭集定义拓扑.
]

#注[#开集;和#闭集;是相对的概念, 但并不完全对立. 例如在#离散拓扑;中, 每个子集既是开集又是闭集.]

#定义(
  uuid: "Neighborhood",
  "邻域",
  "Neighborhood",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$x in S$], [$U subset.eq S$]),
  [$U$ 是 $x$ 的一个 #neighborhood],
)[
  $exists (O subset.eq S), O in tau and x in O and O subset.eq U$,
]

#定义(
  uuid: "NeighborhoodFamily",
  "邻域系 / 邻域族",
  "Neighborhood Family",
  isPredicate: false,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$x in S$]),
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
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$E:Set(alpha) subset.eq S$, $x:alpha in E$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
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
  cstyle: "display",
)[
  $ A "是闭集" arrow.l.r.double A = Closure(A) $
]

#定义(
  uuid: "ClosurePoint",
  "闭包点",
  "Closure Point",
  isPredicate: true,
  bstyle: "display",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$E:Set(alpha) subset.eq S$, $x:alpha in S$]),
  [点 $x$ 是集合 $E$ 的一个闭包点],
)[
  $ x in Closure(E) arrow.l.r.double forall U in Nbr(x), U inter E eq.not emptyset $
]

#定义(
  uuid: "Boundary",
  "边界",
  "Boundary",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$cal(B):Set(alpha) subset.eq tau$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$X subset.eq S$]),
  bstyle: "display",
  [集合 $X$ 上的子空间拓扑],
)[
  $ tau_X = { U inter X | U in tau } $
]

#注[
  由子集诱导的子空间拓扑是从原拓扑中以该子集为边界“截取”出来的. 所以, 子空间拓扑中的#开集/#闭集;不一定是原拓扑中的#开集/#闭集.
]

#定义(
  uuid: "ProductTopology",
  "积拓扑",
  "Product Topology",
  isPredicate: false,
  hypotheses: ([$(X,tau_X), (Y, tau_Y)$ 是#拓扑空间],),
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
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$x in S$], [$U subset.eq S$]),
  [$U: Set(alpha)$ 是点 $x: S$ 的一个去心邻域],
)[
  $U union {x} in Nbr(x) and x in.not U$
]

#定义(
  uuid: "DeletedNeighborhoodFamily",
  "去心邻域系 / 去心邻域族",
  "Deleted Neighborhood Family",
  isPredicate: false,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$x in S$]),
  notation: [$DelNbr(x)$],
  bstyle: "display",
  [点 $x$ 的去心邻域系 / 去心邻域族],
)[
  $ { N : Set(alpha), N in tau | x in N and N without {x} in Nbr(x) } $
]

#定义(
  uuid: "LimitPoint",
  "极限点 / 聚点",
  "Limit Point / Accumulation Point",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$], [$x in S$]),
  [点 $x$ 是集合 $A$ 的一个#limitPoint],
)[
  $forall U subset.eq S$, $U$ 是 $x$ 的一个去心邻域 $arrow U inter A eq.not emptyset$
]

#定义(
  uuid: "DerivedSet",
  "导集",
  "Derived Set",
  isPredicate: false,
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$], [$x in S$]),
  [点 $x$ 是集合 $A$ 的一个孤立点],
)[$x in A and x not in A'$]

#性质(
  "导集与闭包的关系",
  "The relationship between derived set and closure",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$E subset.eq S$]),
)[$E union E' = Closure(E)$.]

#性质(
  "闭集的等价定义",
  "Equivalent definition of closed sets",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$E subset.eq S$]),
)[
  $E$ 是闭集当且仅当 $E$ 包含了它的所有极限点, 即 $E' subset.eq E$.
]

#定义(
  uuid: "DenseSet",
  "稠密集",
  "Dense Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个#稠密;集],
)[$Closure(A) = S$.]

#注[
  谈论稠密集可以在某个拓扑子空间 $X$ 中进行. 这时我们称集合 $A$ 在 $X$ 中稠密, 即 $A$ 在 $X$ 的闭包是 $X$ 本身, 即 $Closure(A)_X = X$.
]

#定义(
  uuid: "NowhereDense",
  "稀疏集 / 无处稠密集",
  "Nowhere Dense Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个稀疏集 / 无处稠密集],
)[
  $Interior(Closure(A)) = emptyset$.
]

#定义(
  uuid: "SelfDense",
  "自稠密集",
  "Self-Dense Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$]),
  [集合 $A$ 是 $S$ 中的一个自稠密集],
)[$A$ 的导集包含了 $A$ 本身, 即 $A subset.eq A'$.]

#定义(
  uuid: "PerfectSet",
  "完美集",
  "Perfect Set",
  isPredicate: true,
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$x_n: Nat -> S$], [$x: S$]),
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
  hypotheses: ([ $(S, tau)$ 是一个#拓扑空间], [$x_n: Nat -> S$], [$x: S$]),
  notation: [$x_n arrow x$],
  [序列 $x_n$ 收敛于点 $x$],
)[
  $x$ 是序列 $x_n$ 的一个极限.
]

#注[
  谈论序列是否收敛需要在拓扑空间中进行. 即选取的拓扑不同, 序列的收敛情况也可能不同. 例如在离散拓扑中, 每个序列都收敛于每个点.
]

#注[
  极限可能不唯一. 例如在#平凡拓扑;中, 每个序列都#convergentForSeq;于每个点.
]

#定义(
  uuid: "SequentialCompactness",
  "序列紧性",
  "Sequential Compactness",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$x_n: Nat arrow S$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
  [集合 $A$ 是一个道路连通的集合],
)[
  $forall x, y in A$, $exists f: [0,1] arrow A$, $f(0) = x$, $f(1) = y$, $f:C([0,1])$.
]

#性质(
  "道路连通蕴含连通",
  "Path connectedness implies connectedness",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$], [$C: Set(Set(S))$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
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
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$K subset.eq S$ #compact]),
)[$forall C subset.eq K$, $C$ 是#闭集 $arrow$ $C$ #compact]

#性质(
  "紧致性的绝对性",
  "Absoluteness of compactness",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$(X,tau_X)$ 是 $S$ 的一个拓扑子空间], [$K subset.eq X$]),
)[$K$ 在 $X$ 中#compact; $arrow.l.r.double$ $K$ 在 $S$ 中#compact;]

#定义(
  uuid: "CountableCompactness",
  "可数紧性",
  "Countable Compactness",
  isPredicate: true,
  bstyle: "display",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$]),
  [集合 $A$ 具有#可数紧;性],
)[
  $forall C$, $C$ 是 $A$ 的一个可数的开覆盖 $arrow.double$ $exists F subset.eq C$, $F$ 是 $A$ 的一个有限的子开覆盖.
  #linebreak()
  即: 任意可数开覆盖都有有限子覆盖.
]

#注[
  在一般的#拓扑空间;中, 紧致性、可数紧性、序列紧性三者是完全不同的性质. 具体而言有以下的关系:
]

#性质(
  "紧致性蕴含可数紧性",
  "Compactness implies countable compactness",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$ #compact]),
)[
  $A$ #可数紧.
]

#性质(
  "序列紧性蕴含可数紧性",
  "Sequential compactness implies countable compactness",
  hypotheses: ([$(S,tau)$ 是#拓扑空间], [$A subset.eq S$ #序列紧]),
)[$A$ #可数紧.]

#例(
  "紧性不蕴含序列紧性",
  "Compactness does not imply sequential compactness",
)[
  考虑 Tychonoff 空间
  $ product_(i in I) X_i $
  $I$ 是某不可数的索引集. 其中每个 $X_i$ 是#compact;的, 承认选择公理, 则其积空间是紧致的. 但它不是#序列紧;的.
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
  (4) $E$ 是#闭集;且有界的.
]

#例(
  "一般拓扑空间中的有界闭集不一定是紧致集",
  "A closed and bounded set in topological space is not necessarily compact",
)[]

== 拓扑空间的例子

#例(
  uuid: "TrivialTopology",
  "平凡拓扑",
  "Trivial Topology",
)[
  设 $S:Set(alpha)$, 则 $S$ 上的平凡拓扑是 $tau = { emptyset, S }$.
]

#性质(
  "平凡拓扑空间的性质",
  "",
  hypotheses: ([$(S,tau)$ 是平凡拓扑空间],),
)[
  1. $S$ 是#connected;的, 因为 $S$ 没有非平凡的开子集, 更不用说两个不交的非平凡开子集了.
  2. $S$ 是#compact;的, 因为 $S$ 的任意开覆盖都包含 $S$ 本身, 从而有一个有限子覆盖.
  3. $forall x in S$, $x$ 的邻域只有一个, 为 $S$.
  4. 设 $E subset.neq S and E eq.not emptyset$, 则 $E$ 既不是#开集, 也不是#闭集. $Interior(E) = emptyset$.
  5. 对任意包含多于1个元素的集合 $A subset.eq S$, $A'=S$, $Closure(A)=S$, $partial A = S$, $A$ 中的每个点都是 $A$ 的一个极限点.
]

#注[
  这些性质都表明, 在平凡拓扑下, 所有点都“粘”在一起, 没有任何办法区分.
]

#例(
  uuid: "DiscreteTopology",
  "离散拓扑",
  "Discrete Topology",
)[
  设 $S:Set(alpha)$, 则 $S$ 上的离散拓扑是 $tau = { A | A subset.eq S } = cal(P)(S)$.
]

#性质(
  "离散拓扑空间的性质",
  "",
  hypotheses: ([$(S,tau)$ 是离散拓扑空间],),
)[
  1. $forall A subset.eq S$, $A$ 既是#开集;也是#闭集;. $Interior(A) = A$, $Closure(A) = A$, $partial A = emptyset$.
  2. $forall A subset.eq S$, $A$ 是#connected;的当且仅当 $A$ 是单点集.
]

#注[
  在离散拓扑下, 每个点都是孤立的, 总有#开集;可以精准地区分每一点.
]

#注[
  平凡拓扑与离散拓扑是两个极端的例子. 前者的开集最少, 后者的开集最多. 前者的点之间没有任何区分, 后者的点之间完全区分.
  这两个极端的例子可以帮助我们理解拓扑空间中开集的作用.
]

#例(
  uuid: "OrderTopology",
  "序拓扑",
  "Order Topology",
)[
  $S:Set(alpha)$ 具有#全序结构,设 $cal(B):Set(Set(alpha))$, 满足
  1. 包含 $S$ 所有开区间 $(a,b) = { x in S | a < x < b }$;
  2. 若 $S$ 有最小元素 $m$, 则包含 $S$ 的所有半开区间 $[m, b) = { x in S | m <= x < b }$;
  3. 若 $S$ 有最大元素 $M$, 则包含 $S$ 的所有半开区间 $(a, M] = { x in S | a < x <= M }$.
  则 $cal(B)$ 是 $S$ 上的一个拓扑基, 从而 $S$ 上的序拓扑是由 $cal(B)$ 生成的拓扑.
]

#例(
  uuid: "",
  "实数上的通常拓扑",
  "Usual Topology on Real Numbers",
)[
  $bb(R)$ 上的通常拓扑是由所有开区间
  $ (a,b) = { x | a < x < b }, (a,b in bb(R) union { -infinity, +infinity }) $
  生成的拓扑.
]

= 连续映射

== 映射的极限与连续性

#定义(
  uuid: "MapLimit",
  "映射的极限",
  "Limit of Map",
  isPredicate: true,
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$], [$x: X$], [$y: Y$]),
  bstyle: "display",
  notation: [$y=limits(lim)_(t arrow x) f(t)$],
  [$f$ 在点 $x$ 处的极限是 $y$],
)[
  $ forall V_y in Nbr(y), exists U_x in DelNbr(x), f(U_x) subset.eq V_y $
]

#定义(
  uuid: "MapConvergence",
  "映射收敛",
  "Convergence of Map",
  isPredicate: true,
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$], [$x: X$], [$y: Y$]),
  bstyle: "display",
  notation: [$t arrow x implies (t) arrow y$],
  [$f$ 在点 $x$ 处收敛于 $y$],
)[
  $f$ 在点 $x$ 处的极限是 $y$.
]

#注[
  1. 映射的极限与映射在该点处的收敛是等价的.
  2. 映射的极限与映射在该点处的像无关.
]

#性质(
  uuid: "HeineReductionPrinciple",
  "Heine 归结原理",
  "Heine's Reduction Principle",
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$], [$x: X$], [$y: Y$]),
  cstyle: "display",
)[
  $f$ 在点 $x$ 处的极限是 $y$ 当且仅当对于任意序列 $x_n$ 收敛于 $x$, 序列 $f(x_n)$ 收敛于 $y$.
  $
    lim_(t arrow x) f(t) = y arrow.l.r.double.long (forall {x_n}: Nat arrow X, lim_(n arrow infinity) x_n = x arrow.r.double.long lim_(n arrow infinity) f(x_n) = y )
  $
]

#定义(
  uuid: "Continuity",
  "连续性",
  "Continuity",
  isPredicate: true,
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$], [$x: X$]),
  bstyle: "display",
  [映射 $f$ 在点 $x$ 处连续],
)[
  $f$ 在点 $x$ 处的极限是 $f(x)$:
  $ lim_(t arrow x) f(t) = f(x). $
]

#定义(
  uuid: "MapContinuity",
  "连续映射",
  "Continuous Map",
  isPredicate: true,
  hypotheses: (
    [$(X,tau_X)$ 是一个#拓扑空间],
    [$(Y,tau_Y)$ 是一个#拓扑空间],
    [$E: Set(alpha) subset.eq X$],
    [$f: E arrow Y$],
  ),
  notation: [$f in Cont(E, Y)$],
  [映射 $f$ 是 $E$ 上的连续映射],
)[
  $forall x in E, lim_(t arrow x) f(t) = f(x)$.
  #linebreak()
  即: $f$ 在任意 $x in E$ 处都#continuous.
]

#性质(
  uuid: "ContinuityViaNeighborhood",
  "连续性的邻域定义",
  "Neighborhood Definition of Continuity",
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$], [$x: X$]),
  cstyle: "display",
)[
  $f$ 在 $x$ 处#continuity;当且仅当对于任意 $f(x)$ 的邻域 $V$, 都存在 $x$ 的一个邻域 $U$, 使得 $f(U) subset.eq V$. 即:
  $forall V in Nbr(f(x)), exists U in Nbr(x), f(U) subset.eq V$.
]

#性质(
  uuid: "ContinuityViaPreimage",
  "连续性的原像定义",
  "Preimage Definition of Continuity",
  hypotheses: (
    [$(X,tau_X)$ 是一个#拓扑空间],
    [$(Y,tau_Y)$ 是一个#拓扑空间],
    [$E subset.eq X$],
    [$f: E arrow Y$],
    [$x: E$],
  ),
  cstyle: "display",
)[
  $f in Cont(E, Y)$ 当且仅当 $f(E)$ 的任意#开集;的原像都是 $E$ 中的一个开集, 即
  $ forall V in tau_Y and V subset.eq f(E), f^(-1)(V) subset.eq E and f^(-1)(V) in tau_X $.
  同理, $f$ 是 $E$ 上的#continuous;映射当且仅当 $f(E)$ 的任意#闭集;的原像都是 $E$ 中的一个闭集.
]

#性质(
  "复合运算保持连续性",
  "Composition Preserves Continuity",
  hypotheses: (
    [$(X,tau_X)$ 是一个#拓扑空间],
    [$(Y,tau_Y)$ 是一个#拓扑空间],
    [$(Z,tau_Z)$ 是一个#拓扑空间],
    [$E subset.eq X$],
    [$f: Cont(E, Y)$],
    [$g: Cont(f(E), Z)$],
  ),
)[
  $g circle.small f in Cont(E, Z)$.
]

#性质(
  "连续映射保持连通性",
  "Continuous Maps Preserve Connectedness",
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$E subset.eq X$], [$f: Cont(E, Y)$]),
)[
  $f(E)$ 在 $Y$ 中#connected.
]

#性质(
  "连续映射保持紧致性",
  "Continuous Maps Preserve Compactness",
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$E subset.eq X$], [$f: Cont(E, Y)$]),
)[
  $f(E)$ 在 $Y$ 中#compact.
]

#定义(
  uuid: "LipschitzContinuity",
  "Lipschitz 连续性",
  "Lipschitz Continuity",
  hypotheses: ([$(X,d_X)$ 是一个度量空间], [$(Y,d_Y)$ 是一个度量空间], [$f: X arrow Y$]),
  notation: [$f in Lip(X, Y)$],
  [映射 $f$ 是一个 Lipschitz 连续映射],
)[
  $exists L > 0$, $forall x_1, x_2 : X$, $d_Y (f(x_1), f(x_2)) <= L dot d_X (x_1, x_2)$.
]

== 同胚映射

#定义(
  uuid: "OpenMap",
  "开映射",
  "Open Map",
  isPredicate: true,
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$]),
  [映射 $f$ 是 $X$ 到 $Y$ 的开映射],
)[
  $forall U subset.eq X$, $U$ 是 $X$ 的一个开集 $arrow f(U)$ 是 $Y$ 的一个开集.
]

#注[
  开映射作用下#开集;的像一定是开集, 用来将拓扑结构推前; 连续映射作用下, #开集;的原像一定是开集, 将拓扑结构拉回. 这也就是为什么*连续映射*又被称为*逆开映射*.
]

#例(
  "开映射不一定是连续映射",
  "An open map is not necessarily a continuous map",
)[
  考虑 $bb(R)$ 上的映射 $f$: 当 $x in bb(Q)$ 时 $f(x) = x$, 当 $x in bb(R) without bb(Q)$ 时 $f(x) = x + 1$. 则 $f$ 是一个开映射, 但不是一个#continuous;映射.
]

#例(
  "连续映射不一定是开映射",
  "A continuous map is not necessarily an open map",
)[
  考虑 $bb(R)$ 上的常值映射 $f(x) = 0$. 则 $f$ 是一个#continuous;映射, 但不是一个开映射.
]


#定义(
  uuid: "Homeomorphism",
  "同胚映射",
  "Homeomorphism",
  isPredicate: true,
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间], [$f: X arrow Y$]),
  [映射 $f$ 是 $X$ 和 $Y$ 之间 / $X$ 到 $Y$ 的同胚映射],
)[
  $f$ 是双射, $f in Cont(X, Y)$, $f^(-1) in Cont(Y, X)$.
]

#注[
  上述定义也可以表述为: 一个映射是同胚映射当且仅当它同时是连续映射、开映射、双射.
]

#定义(
  uuid: "Homeomorphic",
  "同胚",
  "Homeomorphic",
  isPredicate: true,
  hypotheses: ([$(X,tau_X)$ 是一个#拓扑空间], [$(Y,tau_Y)$ 是一个#拓扑空间]),
  notation: [$X tilde.equiv Y$],
  [拓扑空间 $X$ 和 $Y$ 是同胚的],
)[
  $exists f: X arrow Y$, $f$ 是 $X$ 和 $Y$ 之间的一个同胚映射.
]

#性质(
  "紧拓扑空间上连续映射的逆映射也连续",
  "The inverse of a continuous map on a compact space is also continuous",
  hypotheses: (
    [$(X,tau_X)$ 是一个#拓扑空间],
    [$(Y,tau_Y)$ 是一个#拓扑空间],
    [$f: X arrow Y$],
    [$E subset.eq X$ #compact],
    [$f in Cont(E, Y)$],
  ),
)[
  若 $f^(-1)$ 存在, 则 $f^(-1) in Cont(f(E), X)$.
]

== 拓扑空间的分离性

#定义(
  uuid: "T0Space",
  "T0 空间 / Kolmogorov 空间",
  "T0 Space / Kolmogorov Space",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#拓扑空间],),
  [$S$ 是 T0 空间],
)[
  $forall x, y in S$, $x eq.not y implies (exists U in Nbr(x), and y in.not U) or (exists V in Nbr(y), and x in.not V)$,
]

#注[
  在 T0 空间中, 任意两点都可以被一个#开集;区分, 使其一个在开集内, 另一个在开集外.
]
#例(
  "Sierpinski 空间",
  "Sierpinski Space",
)[
  #拓扑空间; $S={x,y}$ 上的 Sierpinski 空间是 $tau = { emptyset, {x}, S }$. 则 $S$ 是一个 T0 空间. 但它不满足更强的分离性.
]

#定义(
  uuid: "T1Space",
  "T1 空间 / Frechet 空间",
  "T1 Space / Frechet Space",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#拓扑空间],),
  [$S$ 是 T1 空间],
)[
  $forall x, y in S$, $x eq.not y implies exists U in Nbr(x), and y in.not U, and exists V in Nbr(y), and x in.not V$,
]

#注[
  在 T1 空间中, 任意一点都可以被#开集;区分.
]

#性质(
  "T1 空间的等价定义",
  "Equivalent definition of T1 space",
  hypotheses: ([$(S,tau)$ 是#拓扑空间],),
)[
  $S$ 是 T1 空间 $arrow.l.r.double$ $forall x in S$, ${x}$ 是#闭集.
  #linebreak()
  即: 单点集是闭集.
]

#例(
  "无限集合上的有限补拓扑",
  "Cofinite Topology",
)[
  设 $X:Set(alpha)$ 是无限集合. 定义#topology:
  $ tau:= {U subset.eq X | X without U "is finite"} union { emptyset } $
  则 $(X,tau)$ 是#拓扑空间. 它是一个 T1 空间, 因为任意单点集 ${x}$ 的补集 $X without {x}$ 都是无限的, 从而 ${x}$ 是#闭集. 但它不满足更强的分离性.
]

#例(
  "T1 空间上的极限可能不唯一",
  "Limits may not be unique in T1 spaces",
)[
  设 $(X,tau)$ 是无限集合上的有限补拓扑空间, 则该空间中的序列可以收敛到多个极限, 实际上是无穷多个极限. 因为这其中的点的开邻域都是无限集合.
]

#定义(
  uuid: "T2Space",
  "T2 空间 / Hausdorff 空间",
  "T2 Space / Hausdorff Space",
  isPredicate: true,
  hypotheses: ([$(S,tau)$ 是#拓扑空间],),
  [$S$ 是 T2 空间],
)[
  $forall x, y in S$, $x eq.not y implies exists U in Nbr(x), and V in Nbr(y), and U inter V = emptyset$,
]

#性质(
  "T2 空间上的极限是唯一的",
  "Limits are unique in T2 spaces",
)[]

#注[
  T2 空间实际上保证了任意两点都可以用各自的不交邻域区分. 这种严格的分离性确保了点不会粘在一起, 从而保证了极限的唯一性.
]

#性质(
  "T2 空间中的紧致集是闭集",
  "Compact sets are closed in T2 spaces",
  hypotheses: ([$(S,tau)$ 是 T2 空间], [$K subset.eq S$ #compact]),
)[
  $K$ 是#闭集;.
]

#性质(
  "T2 空间上的紧集套定理",
  "Nested Compact Set Theorem in T2 spaces",
  hypotheses: (
    [$(S,tau)$ 是 T2 空间],
    [$K_n: Nat arrow Set(S)$],
    [$forall n in Nat, K_(n+1) subset.eq K_n$],
    [$forall n in Nat, K_n eq.not emptyset, K$ #compact],
  ),
)[
  $inter.big_(n in Nat) K_n eq.not emptyset$.
]

#性质(
  "Hausdorff 空间之间的连续映射保持点列的收敛性",
  "Continuous maps between Hausdorff spaces preserve convergence of sequences",
  hypotheses: (
    [$(X,tau_X)$ 是 T2 空间],
    [$(Y,tau_Y)$ 是 T2 空间],
    [$f: X arrow Y$],
    [$x_n: Nat arrow X$],
    [$x: X$],
    [$x_n arrow x$],
    [$f$ 在 $x$ 处#continuity;],
  ),
)[
  $f(x_n) arrow f(x)$.
  #linebreak()
  此定理的另一种表述方法是: 若 $f$ 是 T2 空间之间的连续映射, 则极限与映射可交换顺序.
]

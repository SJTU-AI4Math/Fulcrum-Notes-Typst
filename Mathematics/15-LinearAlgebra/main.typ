#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../contributors.typ": *

#import "../03-SetTheory/export.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../08-BasicAlgebra/export.typ": *

#import "./export.typ": *

#show: FulcrumCN
#show: SetStyle
#show: TypeStyle
#show: AlgebraStyle
#show: LinearAlgebraStyle

#title([线性代数])

#outline(title: "目录", indent: 2em)

#pagebreak()

= 向量和线性空间

== 向量和线性空间

#约定[
  - $KK$ 是#域
  - $V : Type$
  - $("_" + "_") : V -> V -> V$
  - $("_" dot "_") : KK -> V -> V$
]

#结构(
  uuid: "LinearSpace",
  "线性空间",
  "Linear Space",
  hypotheses: ([ $KK$ 是#域],),
  isPredicate: true,
  [$(V, +, dot)$ 是 $KK$ 上的#线性空间],
  (
    (
      name: [加法交换律],
      name_en: [Commutativity],
      value: [$ forall (bold(alpha), bold(beta) : V), bold(alpha) + bold(beta) = bold(beta) + bold(alpha) $],
      style: "display",
    ),
    (
      name: [加法结合律],
      name_en: [Associativity],
      value: [$ forall (bold(alpha), bold(beta), bold(gamma) : V), bold(alpha) + (bold(beta) + bold(gamma)) = (bold(alpha) + bold(beta)) + bold(gamma) $],
      style: "display",
    ),
    (
      name: [加法恒等元],
      name_en: [Zero],
      value: [$ exists (bold(0) : V), forall (bold(alpha) : V), bold(alpha) + bold(0) = bold(alpha) $],
      style: "display",
    ),
    (
      name: [加法逆元],
      name_en: [Additive inverse],
      value: [$ forall (bold(alpha) : V), exists (bold(beta) : V), bold(alpha) + bold(beta) = bold(0) $],
      style: "display",
    ),
    (
      name: [数乘结合律],
      name_en: [Scalar associativity],
      value: [$ forall (k, l : KK), forall (bold(alpha) : V), k dot (l dot bold(alpha)) = (k dot l) dot bold(alpha) $],
      style: "display",
    ),
    (
      name: [数乘分配律对向量],
      name_en: [Distributivity over vectors],
      value: [$ forall (k : KK), forall (bold(alpha), bold(beta) : V), k dot (bold(alpha) + bold(beta)) = k dot bold(alpha) + k dot bold(beta) $],
      style: "display",
    ),
    (
      name: [数乘分配律对数域],
      name_en: [Distributivity over scalars],
      value: [$ forall (k, l : KK), forall (bold(alpha) : V), (k + l) dot bold(alpha) = k dot bold(alpha) + l dot bold(alpha) $],
      style: "display",
    ),
    (
      name: [数乘恒等元],
      name_en: [Scalar identity],
      value: [$ exists (1 : KK), forall (bold(alpha) : V), 1 dot bold(alpha) = bold(alpha) $],
      style: "display",
    ),
  ),
)

// #注[$(V, +, dot)$ 为#线性空间 时，$V$ 亦称*向量空间*]

// #注[令([$bold(alpha)$ 的加法逆元], value: [$-bold(alpha)$])]

// #注[令([$bold(alpha) + (bold(beta) + bold(gamma))$ 与 $(bold(alpha) + bold(beta)) + bold(gamma)$], value: [$bold(alpha) + bold(beta) + bold(gamma)$])]

// #注[令([$k (l dot bold(alpha))$ 与 $(k dot l) dot bold(alpha)$], value: [$k l bold(alpha)$])]

#性质("零向量的唯一性", "", [$bold(0)$ 唯一], hypotheses: ([ $(V, +, dot)$ 是 $KK$ 上的#线性空间],))

#性质("负向量的唯一性", "", [$-bold(alpha)$ 唯一], hypotheses: (
  [ $(V, +, dot)$ 是 $KK$ 上的#线性空间],
  [ $bold(alpha) : V$],
))

#性质(
  "加法消去律成立",
  "",
  [$bold(alpha) + bold(gamma) = bold(beta) + bold(gamma)$ #implies $bold(alpha) = bold(beta)$],
  hypotheses: (
    [ $(V, +, dot)$ 是 $KK$ 上的#线性空间],
    [ $bold(alpha), bold(beta), bold(gamma) : V$],
  ),
)

#性质("0 乘以任意向量等于零向量", "", [$0 dot bold(alpha) = bold(0)$], hypotheses: (
  [ $(V, +, dot)$ 是 $KK$ 上的#线性空间],
  [ $bold(alpha) : V$],
))

#性质("任意数乘以零向量等于零向量", "", [$k dot bold(0) = bold(0)$], hypotheses: (
  [ $KK$ 是#域],
  [ $(V, +, dot)$ 是 $KK$ 上的#线性空间],
  [ $k : KK$],
))

#性质("-1 乘以任意向量等于负向量", "", [$(-1) dot bold(alpha) = -bold(alpha)$], hypotheses: (
  [ $(V, +, dot)$ 是 $KK$ 上的#线性空间],
  [ $bold(alpha) : V$],
))

#性质(
  "一个数与一个向量相乘为零向量当且仅当数为零或向量为零向量",
  "",
  [$k dot bold(alpha) = bold(0)$ #iff $(k = 0)$ 或 $(bold(alpha) = bold(0))$],
  hypotheses: ([ $KK$ 是#域], [ $(V, +, dot)$ 是 $KK$ 上的#线性空间], [ $k : KK$, $bold(alpha) : V$]),
)

== 向量的线性关系

#约定[
  - $KK$ 是#域，$V$ 是 $KK$ 上的#线性空间
  - $bold(alpha)_1, bold(alpha)_2, dots, bold(alpha)_n, bold(beta) : V$
]

#定义(
  uuid: "LinearCombination",
  "线性表示",
  "Linear Representation",
  hypotheses: ([ $KK$ 是#域], [$V$ 是 $KK$ 上的#线性空间], [ $bold(alpha)_1, dots, bold(alpha)_n, bold(beta) : V$]),
  [$bold(beta)$ 可被 $bold(alpha)_1, dots, bold(alpha)_n$ #线性表示],
  [ $exists k_1, dots, k_n : KK, bold(beta) = sum_(i=1)^n k_i bold(alpha)_i$],
  isPredicate: true,
  bstyle: "display",
)

#定义(
  uuid: "LinearlyRelated",
  "线性相关",
  "Linearly Related",
  hypotheses: ([ $KK$ 是#域], [$V$ 是 $KK$ 上的#线性空间], [ $A : #Set($V$)$]),
  [$A$ #线性相关],
  [ $exists bold(alpha)_i in A$，$bold(alpha)_i$ 可被 $A without {bold(alpha)_i}$ #线性表示],
  isPredicate: true,
  bstyle: "display",
)
#定义(
  uuid: "LinearlyIndependent",
  "线性无关",
  "Linearly Independent",
  hypotheses: ([#link(<LinearlyRelated>, [同上])],),
  [$A$ #线性无关],
  [ $forall bold(alpha)_i in A$，$bold(alpha)_i$ 不可被 $A without {bold(alpha)_i}$ #线性表示],
  isPredicate: true,
  isExtension: true,
  bstyle: "display",
)

#性质(
  "线性相关与零组合",
  "",
  cstyle: "display",
  [#enum(
    [$A$ #线性相关 #iff $exists n : bb(N)_+, exists bold(alpha)_1, dots, bold(alpha)_n in A, exists k_1, dots, k_n : KK$，$(sum_(i=1)^n k_i bold(alpha)_i = bold(0)) and (exists j in {1, dots, n}, k_j != 0)$],
    [$A$ #线性无关 #iff $forall n : bb(N)_+, forall bold(alpha)_1, dots, bold(alpha)_n in A, forall k_1, dots, k_n : KK$，$sum_(i=1)^n k_i bold(alpha)_i = bold(0) implies k_1 = dots = k_n = 0$],
  )],
  hypotheses: ([ $A : #Set($V$)$],),
)

#性质(
  "线性相关和线性无关的另一等价定义",
  "",
  cstyle: "display",
  [#enum(
    [$A$ #线性无关 #iff $forall bold(beta)$，$bold(beta)$ 可被 $A$ #线性表示 #implies 表示唯一],
    [$A$ #线性相关 #iff $exists bold(beta)$ 可被 $A$ #线性表示 且 表示不唯一],
  )],
  hypotheses: ([ $A : #Set($V$)$],),
)

#性质(
  "线性相关的包含性",
  "",
  cstyle: "display",
  [#enum(
    [$A$ #线性无关 #implies $forall B subset.eq A$，$B$ #线性无关],
    [$A$ #线性相关 #implies $forall B supset.eq A$，$B$ #线性相关],
  )],
  hypotheses: ([ $A, B : #Set($V$)$],),
)

== 极大线性无关组与秩

#约定[
  - $KK$ 是#域，$V$ 是 $KK$ 上的#线性空间
  - $S : #Set($V$)$，$S = {bold(alpha)_1, dots, bold(alpha)_n}$
]

#定义(
  uuid: "MaximallyLinearlyIndependentSet",
  "极大线性无关组",
  "Maximally Linearly Independent Set of Vectors",
  hypotheses: ([ $S : #Set($V$)$], [ $A subset.eq S$]),
  [$A$ 是 $S$ 的#极大线性无关组],
  [ $ #structProp(
    (name: [线性无关], value: [$A$ #线性无关]),
    (name: [张成], value: [$forall bold(alpha) in S$，$bold(alpha)$ 可被 $A$ #线性表示]),
  ) $],
  isPredicate: true,
  bstyle: "display",
)

#性质("极大线性无关组的任意存在性", "", [$S$ 必有#极大线性无关组], hypotheses: (
  [ $S : #Set($V$)$],
  [ $S$ 有限],
  [ $exists bold(alpha) in S, bold(alpha) != bold(0)$],
))

#定理("极大线性无关组的等价性", "", [$|A| = |B|$], hypotheses: ([ $S : #Set($V$)$], [ $A, B$ 为 $S$ 的#极大线性无关组]))

#定义(
  uuid: "Rank",
  "秩",
  "Rank",
  hypotheses: ([ $S : #Set($V$)$],),
  [$S$ 的#秩],
  [$S$ 的#极大线性无关组 的元素个数],
  notation: [$rank(S)$ 或 $op("r")(S)$],
)

== 线性空间的基与维度

#约定[
  - $KK$ 是#域，$V$ 是 $KK$ 上的#线性空间
  - $E : #Set($V$)$，$E = {e_1, dots, e_n}$
]

#定义(
  uuid: "Basis",
  "线性空间的基",
  "Basis of Linear Space",
  hypotheses: ([ $V$ 是 $KK$ 上的#线性空间],),
  [$E$ 是 $V$ 的#基],
  [ $ #structProp(
    (name: [线性无关], value: [$E$ #线性无关]),
    (name: [张成], value: [$forall bold(alpha) : V$，$bold(alpha)$ 能被 $E$ #线性表示]),
  ) $],
  isPredicate: true,
  bstyle: "display",
)

#定义(
  uuid: "Dimension",
  "维度",
  "Dimension",
  hypotheses: ([ $V$ 是 $KK$ 上的#线性空间], [$E : #Set($V$)$], [$E$ 有限], [$E$ 是 $V$ 的#基],),
  [$V$ 的维数],
  [ $|E|$],
  notation: [$dim V$],
)

#注[当不存在满足条件的有限 $E : #Set($V$)$ 使得 $E$ 是 $V$ 的#基;时，$V$ 为*无限维线性空间*]

#性质("高维向量组必定线性相关", "", [$A$ #线性相关], hypotheses: ([ $dim V = n$], [$A : #Set($V$)$], [$|A| > n$]))

#性质("线性表示与基的关系", "", [$E$ #线性无关 #iff $V$ 能被 $E$ #线性表示 #iff $E$ 是 $V$ 的#基], hypotheses: (
  [ $dim V = n$],
  [$E : #Set($V$)$],
))

#定理(
  "基扩张定理",
  "Basis Extension Theorem",
  [$exists B subset.eq E$，$|B| = n - |A|$，$A union B$ 是 $V$ 的#基],
  hypotheses: ([ $dim V = n$], [ $E$ 是 $V$ 的#基], [ $A : #Set($V$)$ #线性无关], [ $|A| < n$]),
)

== 子空间及其运算

#约定[
  - $KK$ 是#域，$V$ 是 $KK$ 上的#线性空间
  - $V_1, V_2 subset.eq V$
]

#定义(
  uuid: "LinearSubspace",
  "线性子空间",
  "Linear Subspace",
  hypotheses: ([ $V$ 是 $KK$ 上的#线性空间], [ $W subset.eq V$ 非空]),
  [$W$ 是 $V$ 的#线性子空间],
  [$W$ 关于 $V$ 的加法和数乘也构成 $KK$ 上的#线性空间],
  isPredicate: true,
)

#性质("平凡子空间", "", [$V$ 与 ${bold(0)}$ 是 $V$ 的#线性子空间，亦称*平凡子空间*], hypotheses: (
  [ $(V, +, dot)$ 是 $KK$ 上的#线性空间],
))

#性质("非平凡子空间", "", [$0 < dim W < n$], hypotheses: (
  [ $dim V = n$],
  [$W$ 是 $V$ 的非平凡#线性子空间],
  [$dim {bold(0)} = 0$],
))

#定义(
  "子空间的交",
  "",
  hypotheses: ([ $V_1, V_2$ 是 $V$ 的子空间],),
  [$V_1$ 与 $V_2$ 的交],
  [${bold(v) | bold(v) in V_1, bold(v) in V_2}$],
  notation: [$V_1 inter V_2$],
)
#定义(
  "子空间的和",
  "",
  hypotheses: ([ $V_1, V_2$ 是 $V$ 的子空间],),
  [$V_1$ 与 $V_2$ 的和],
  [${bold(alpha) + bold(beta) | bold(alpha) in V_1, bold(beta) in V_2}$],
  notation: [$V_1 + V_2$],
  isExtension: true,
)

#性质("子空间的交与和仍为子空间", "", [$V_1 inter V_2$ 与 $V_1 + V_2$ 都是 $V$ 的#线性子空间], hypotheses: (
  [ $V_1, V_2$ 是 $V$ 的#线性子空间],
))

#定义(
  uuid: "Span",
  "张成",
  "Span",
  hypotheses: ([ $V$ 是 $KK$ 上的#线性空间], [ $S : #Set($V$)$]),
  [由 $S$ #张成 的线性空间],
  [{ $bold(v) | bold(v)$ 能被 $S$ #线性表示 }],
  notation: [$span(S)$],
)

#性质("张成的线性空间也是子空间", "", [$span(S)$ 是 $V$ 的#线性子空间], hypotheses: ([ $S : #Set($V$)$],))

#性质("子空间的张成仍为子空间", "", [$span(S) subset.eq W$], hypotheses: (
  [ $W$ 是 $V$ 的#线性子空间],
  [ $S : #Set($V$)$, $S subset.eq W$],
))

#性质("等价性", "", [$T$ 是 $span(S)$ 的#基，$dim span(S) = |T|$], hypotheses: (
  [ $S : #Set($V$)$],
  [ $T$ 是 $S$ 的#极大线性无关组],
))

#定理("线性空间维度公式", "", [$dim (V_1 + V_2) = dim V_1 + dim V_2 - dim (V_1 inter V_2)$], hypotheses: (
  [ $V_1, V_2$ 是 $V$ 的#线性子空间],
))

#定义(
  uuid: "DirectSum",
  "直和",
  "Direct Sum",
  hypotheses: ([ $V_1, dots, V_n$ 是 $V$ 的子空间],),
  [$V_1 + dots + V_n$ 为#直和],
  [ $ forall i in {1, dots, n}, V_i inter (V_1 + dots + V_(i-1) + V_(i+1) + dots + V_n) = {bold(0)} $],
  isPredicate: true,
  notation: [$V_1 plus.o dots plus.o V_n$],
  bstyle: "display",
)

#定理(
  "直和定理",
  "",
  [ $alpha iff beta iff gamma iff delta$],
  hypotheses: (
    [ $V = V_1 + dots + V_n$],
    [ $V_1, dots, V_n$ 是 $V$ 的#线性子空间],
    令($alpha$, type: $Prop$, [$V = V_1 plus.o dots plus.o V_n$]),
    令($beta$, type: $Prop$, [$dim V = sum_(i=1)^n dim V_i$]),
    令($gamma$, type: $Prop$, [各 $V_i$ 的#基;可并成 $V$ 的#基]),
    令($delta$, type: $Prop$, [$forall bold(v) : V$，$bold(v)$ 能唯一表示为 $V_1, dots, V_n$ 中向量之和]),
  ),
  hstyle: "display",
  cstyle: "display",
)

== 商空间

#约定[
  - $V$ 是 $KK$ 上的#线性空间
  - $W subset.eq U subset.eq V$，$W$ 与 $U$ 均为子空间
]

#定义(
  uuid: "Translate",
  "转译",
  "Translate",
  hypotheses: ([ $U, W$ 为 $V$ 的子空间], [ $W subset.eq U$]),
  [ $bold(alpha)$ 模 $W$ 的*转译*],
  [$bold(alpha) + W = {bold(alpha) + bold(w) | bold(w) in W}$],
)

#定义(
  uuid: "Coset",
  "陪集",
  "Coset",
  hypotheses: ([#link(<Translate>, [同上])],),
  [$W$ 的#陪集],
  [${ alpha + W | alpha in U }$],
)

#定义(
  uuid: "QuotientSpace",
  "商空间",
  "Quotient Space",
  hypotheses: ([#link(<Coset>, [同上])],),
  [$U$ 模 $W$ 的#商空间],
  [陪集全体，运算定义为 $bar(bold(alpha)) + bar(bold(beta)) = bar(bold(alpha) + bold(beta))$，$c dot bar(bold(alpha)) = bar(c dot bold(alpha))$],
  notation: [$U / W$],
)

#性质("商空间的维度", "Dimension of Quotient Space", [$dim (U / W) = dim U - dim W$], hypotheses: (
  [ $U, W$ 为 $V$ 的#线性子空间],
  [ $W subset.eq U$],
))

== 常见的线性空间

#例(
  uuid: "RowVectorSpace",
  "行向量空间",
  "Row Vector Space",
)[
  #约定[
    - $KK$ 是#域，$n : bb(N)$
    - $KK^n = KK times dots times KK$（$n$ 个）
    - 加法：$(x_1, dots, x_n) + (y_1, dots, y_n) = (x_1 + y_1, dots, x_n + y_n)$
    - 数乘：$k(x_1, dots, x_n) = (k x_1, dots, k x_n)$
  ]
  $(KK^n, +, dot)$ 是 $KK$ 上的#线性空间，$dim KK^n = n$。$bold(e)_i = (0, dots, 1, dots, 0)$（第 $i$ 个分量为 1），$bold(e)_1, dots, bold(e)_n$ 是 $KK^n$ 的#基，亦称*标准单位行向量*
]

#例(
  uuid: "ColumnVectorSpace",
  "列向量空间",
  "Column Vector Space",
)[
  #约定[$KK_n = {(x_1, dots, x_n)^T | x_i in KK}$，加法与数乘与#link(<RowVectorSpace>, [行向量空间])同构]
  $(KK_n, +, dot)$ 是 $KK$ 上的#线性空间，$dim KK_n = n$
]

#例(
  "多项式的线性空间",
  "Linear Space of Polynomials",
)[
  #约定[$KK[x]_n = { sum_(i=0)^n a_i x^i | a_i in KK }$]
  $(KK[x]_n, +, dot)$ 是 $KK$ 上的#线性空间，$dim KK[x]_n = n + 1$
]

= 线性映射

== 线性映射
== 对偶映射
== 线性映射基本定理
== 坐标向量与基变换
== 不变子空间

= 矩阵

== 线性映射与矩阵
== 矩阵的运算
== 方阵的逆阵
== 矩阵的初等变换与 Gauss 消元法
== 矩阵的相抵关系与矩阵的秩
== 适定、欠定线性方程组的解
== 矩阵与线性映射的关系

= 行列式

== 行列式
== 行列式的性质
== 矩阵与行列式
== Cramer 法则
== Laplace 定理

= 内积空间

== 内积与范数
== 正交子空间
== 正交变换
== 超定线性方程组与最小二乘问题
== 复内积空间

= 多项式

== 一元多项式代数
== 多项式数论
== 多项式函数
== 复系数多项式
== 实系数、有理系数、整系数多项式与 Eisenstein 判别法
== 多元多项式
== 对称多项式与 Newton 公式
== Sylvester 行列式

= 特征分解

== 特征值与特征向量
== 相似对角化
== Cayley-Hamilton 定理
== 特征值的估计
== 特征值理论与微分方程组
== Jordan 标准形
== 乘法可交换的矩阵的性质

= 多项式矩阵

== 以多项式为元素的矩阵
== 多项式矩阵的相抵标准型
== 初等因子与方阵相似标准型

= 双线性型与二次型

== 双线性型
== 二次型
== 化二次型为标准形的方法
== 正定二次型
== Hermite 型简介
== 正定矩阵与内积的关系

= 奇异值分解 (SVD)

== 奇异值与奇异向量
== 极分解

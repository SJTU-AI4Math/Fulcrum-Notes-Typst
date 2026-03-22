/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* topology */
#import "../54-Topology/export.typ": *

/* algebra */
#import "../15-LinearAlgebra/export.typ": *

/* differential theory */
#import "../26-BasicAnalysis/export.typ": *

#show: FulcrumCN

// #hideRemark

#align(center)[
  #block(text(weight: "bold", size: 2.5em)[泛函分析])
]

#align(center)[
  #block(text(weight: "bold", size: 1.5em)[Functional Analysis])
]

#outline(title: "Contents", indent: 2em)

#pagebreak()

= 基本定义

== Banach 空间

#结构(
  uuid: "Norm",
  "范数",
  "Norm",
  isPredicate: true,
  [#线性空间 $V$ 上的函数 $p: V arrow bb(R)$ 是 $V$ 上的*范数函数*],
  (
    (
      name: [非退化性 / 正定性],
      name_en: [Non-degeneracy / Positive-definiteness],
      value: [
        $p(x)=0$ iff $x=0$,
      ],
    ),
    (
      name: [绝对齐次性],
      name_en: [Absolute Homogeneity],
      value: [
        $forall lambda in bb(R), x in V: p(lambda x) = |lambda| p(x)$,
      ],
    ),
    (
      name: [次可加性 / 三角不等式],
      name_en: [Subadditivity / Triangle Inequality],
      value: [
        $forall x,y in V: p(x+y) <= p(x) + p(y)$,
      ],
    ),
  ),
)

#定义(
  uuid: "NVS",
  "赋范线性空间",
  "Normed Vector Space",
  isPredicate: true,
  [#线性空间 $V$ 成为*赋范线性空间*],
)[
  $V$ 上存在范数函数 $||dot|| arrow bb(R)$.
]

#注[
  #nvs;一般记为 $(V,||dot||)$, 其中 $V$ 是线性空间, $||dot||$ 是 $V$ 上的范数函数. 也称 $V$ 为装备了范数 $||dot||$ 的赋范线性空间.
]

#性质(
  "范数可以诱导度量",
  "Norm induces a metric",
  hypotheses: ([$(X,||dot||)$ 是#nvs],),
)[
  $d(x,y) = ||x-y||$ 定义了 $X$ 上的度量, 使得 $(X,d)$ 成为度量空间.
]

#性质(
  "范数诱导的度量的性质",
  "Properties of the metric induced by a norm",
  hypotheses: ([$(X,||dot||)$ 是#nvs], [$d(x,y) = ||x-y||$]),
)[
  $d$ 满足以下性质:
  1. *平移不变性 (Translation Invariance)*: $||x - y|| = ||(x - z) - (y - z)||, forall z in X$.
  2. *绝对齐次性 (Absolute Homogeneity)*: $||alpha x - alpha y|| = |alpha| dot ||x - y|| forall alpha in bb(R)$.
]

#注[
  一般度量不能诱导范数.
]

#定义(
  uuid: "BS",
  "Banach 空间",
  "Banach Space",
  isPredicate: true,
  [#nvs $(X,||dot||)$ 成为*Banach 空间*],
)[
  $X$ 的范数诱导的度量完备.
]

#例(
  "有限维 Eucild 空间",
  "Finite-dimensional Euclidean spaces",
)[
  $(bb(R)^d, ||dot||_p)$ 是 #bs, 其中 $||dot||_p$ 是 $p$ 范数: 定义为: 如果 $1 <= p < infinity$, $||x||_p = (sum_(i=1)^d |x_i|^p)^(frac(1, p))$; 如果 $p = infinity$, 则定义为 $||x||_infinity = max_(1 <= i <= d) |x_i|$.
]

#注[
  $p$ 范数的次可加性 (Subadditivity) 可以使用 Holder 不等式证明.
]

#例(
  "收敛序列空间",
  "Sequence spaces",
)[
  $ell^p$ 是 Banach 空间. 定义为所有求和收敛的序列:

  $ell^p = {x = (x_n)_{n=1}^infinity : sum_(n=1)^infinity |x_n|^p < infinity}$, 其中 $||x||_p = (sum_(n=1)^infinity |x_n|^p)^(frac(1, p))$.

  当 $p=infinity$ 时, 定义为所有有界序列:
  $ell^infinity = {x = (x_n)_{n=1}^infinity : sup_(n in bb(N)) |x_n| < infinity}$, 其中 $||x||_infinity = sup_(n in bb(N)) |x_n|$.
]

#例(
  "连续函数空间",
  "Spaces of continuous functions",
)[
  设 $X$ 是 #compact 度量空间, $C(X)$ 定义为所有在 $X$ 上连续的实值函数, 配备上确界范数 $||f||_infinity = sup_(x in X) |f(x)|$. 则 $(C(X), ||dot||_infinity)$ 是 Banach 空间.
]

#注[
  证明#compact;集上的一致收敛保持连续性: 使用连续性和收敛性三段控制即可.
]

#例(
  "无限维空间上的闭球不是紧的",
  "Closed balls in infinite-dimensional spaces are not compact",
)[
  考虑 $C([0,1])$ 中的闭球 $B = {f in C([0,1]) : ||f||_infinity <= 1}$. 定义函数列 $f_n(x) = x^n$. 则 $f_n$ 是 $B$ 中的一个序列, 但它没有收敛的子列. 因此 $B$ 不是#compact;集.
]

#注[
  证明 $f_n$ 没有收敛的子列: 如果 $f_n$ 收敛于某个函数 $f$, 则对于 $x in [0,1)$, $f(x) = 0$, 而对于 $x=1$, $f(1) = 1$. 这与连续性矛盾.

  事实上, $C([0,1])$ 甚至不是完备的. 上面的函数列 $f_n$ 是 Cauchy 序列, 但它不收敛于 $C([0,1])$ 中的任何函数. 不完备的空间自然不会是紧的.
]

#定理(
  "Banach 空间的子空间是 Banach 空间当且仅当它是闭的",
  "A subspace of a Banach space is a Banach space iff it is closed",
  hypotheses: ([$X$ 是 #bs], [$Y$ 是 $X$ 的#线性子空间]),
)[
  $Y$ 是#bs; $arrow.l.r.double$ $Y$ 是 $X$ 中的#闭集.
]

#注[
  线性子空间不一定是闭的. 例如在 $C([0,1])$ 中, 多项式函数构成的子空间不是闭的.
]

#例(
  "序列空间的有限维子空间",
  "Finite-dimensional subspaces of sequence spaces",
)[
  设 $X=ell^p$, 向量 $e_i=(0, ..., 1, ..., 0)$, 其中第 $i$ 个分量为 $1$, 其余为 $0$. 则 ${e_i}_(i=1)^infinity$ 是 $ell^p$ 中的一组基.

  设 $Z$ 是 $ell^p$ 中的子空间, 由所有有限非零分量的向量组成. 则 $Z$ 在 $ell^p$ 中稠密且是 $ell^p$ 的一个线性子空间, 但它不是闭的. 因为 $Z$ 中的序列 $x_n = (1, 1/2, ..., 1/n, 0, 0, ...)$ 收敛于 $x = (1, 1/2, ..., 1/n, ...)$, $x$ 不在 $Z$ 中, 但 $x$ 在 $overline(Z)$ 中. 所以 $Z$ 不是闭的, 也不是 Banach 空间.
]

#注[
  事实上, $Z$ 不能赋予任何范数使其成为 #bs.
]

#定理(
  "有限维线性空间的线性子空间是闭的",
  "Linear subspaces of finite-dimensional vector spaces are closed",
  hypotheses: ([$V$ 是#线性空间, $dim (V) < infinity$],),
)[
  $forall W$ 是 $V$ 的#线性子空间, $W$ 是 $V$ 中的#闭集.
]

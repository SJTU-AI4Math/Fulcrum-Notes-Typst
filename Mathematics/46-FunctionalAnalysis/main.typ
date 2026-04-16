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
        $forall lambda : bb(R), x : V: p(lambda x) = |lambda| p(x)$,
      ],
    ),
    (
      name: [次可加性 / 三角不等式],
      name_en: [Subadditivity / Triangle Inequality],
      value: [
        $forall x,y : V, p(x+y) <= p(x) + p(y)$,
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
  1. *平移不变性 (Translation Invariance)*: $||x - y|| = ||(x - z) - (y - z)||, forall z : X$.
  2. *绝对齐次性 (Absolute Homogeneity)*: $||alpha x - alpha y|| = |alpha| dot ||x - y|| forall alpha : bb(R)$.
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
  "装备 p 范数的有限维 Eucild 空间",
  "Finite-dimensional Euclidean spaces equipped with p-norms",
)[
  $(bb(R)^d, ||dot||_p)$ 是 #bs, 其中 $||dot||_p$ 是 $p$ 范数: 定义为: 如果 $1 <= p < infinity$, $||x||_p = (sum_(i=1)^d |x_i|^p)^(frac(1, p))$; 如果 $p = infinity$, 则定义为 $||x||_infinity = max_(1 <= i <= d) |x_i|$.
]

#注[
  $p$ 范数的次可加性 (Subadditivity) 可以使用 Holder 不等式证明.
]

#例(
  "装备 p 范数的收敛序列空间",
  "Sequence spaces equipped with p-norms",
)[
  $ell^p$ 是 Banach 空间. 定义为所有求和收敛的序列:

  $ell^p = {x = (x_n)_{n=1}^infinity : sum_(n=1)^infinity |x_n|^p < infinity}$, 其中 $||x||_p = (sum_(n=1)^infinity |x_n|^p)^(frac(1, p))$.

  当 $p=infinity$ 时, 定义为所有有界序列:
  $ell^infinity = {x = (x_n)_{n=1}^infinity : sup_(n : bb(N)) |x_n| < infinity}$, 其中 $||x||_infinity = sup_(n : bb(N)) |x_n|$.
]

#例(
  "装备上确界范数的连续函数空间",
  "Spaces of continuous functions equipped with the supremum norm",
)[
  设 $X$ 是 #compact 度量空间, $Cont(X, bb(R))$ 定义为所有在 $X$ 上连续的实值函数, 配备上确界范数 $||f||_infinity = sup_(x : X) |f(x)|$. 则 $(Cont(X, bb(R)), ||dot||_infinity)$ 是 #bs.
]

#注[
  证明#compact;集上的一致收敛保持连续性: 使用连续性和收敛性三段控制即可.
]

#例(
  "装备 Lipschitz 范数的带基点的 Lipschitz 函数空间",
  "Spaces of Lipschitz functions equipped with the Lipschitz norm",
)[
  设 $X$ 是#compact;度量空间, $x_0 : X$, $f: Lip(X, bb(R))$, 定义 $L_0(X)$ 为所有满足 $f(x_0) = 0$ 的 $f$ 的集合, 其范数为 Lipschitz 常数 $||f||_("Lip") = sup_(x eq.not y) frac(|f(x) - f(y)|, d(x,y))$. 则 $(L_0(X), ||dot||_("Lip"))$ 是 #bs.
]

#注[
  如果不带基点, 则该空间不是#nvs. 因为这时的 Lipschitz 常数甚至不是范数.
]

#例(
  "装备C1范数的连续可微函数空间",
  "Spaces of continuously differentiable functions equipped with the C1 norm",
)[
  设 $X$ 是#compact;度量空间, $C^1(X, bb(R))$ 定义为所有在 $X$ 上连续可微的实值函数, 配备 $C^1$ 范数 $||f||_("C1") = ||f||_infinity + ||f'||_infinity$. 则 $(C^1(X, bb(R)), ||dot||_("C1"))$ 是 #bs.
]

#注[
  装备上确界范数的 $C^1$ 函数空间不是#bs. 因为存在连续可微函数列的极限是不是连续可微的. 例如, 定义 $f_n (x) = sqrt(x^2 + frac(1, n^2))$. 则 $f_n$ 是连续可微的, 但极限函数 $f(x) = |x|$ 在 $x=0$ 处不是连续可微的.
]

#注[
  有时也为连续可微函数空间配备带基点的 $C^1$ 函数空间范数: $||f||_("C1") = f(x_0) + ||f'||_infinity$, 这里 $x_0$ 是 $X$ 中的固定一点. 则 $(C^1(X, bb(R)), ||dot||_("C1"))$ 是 #bs.
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

#定理(
  "Banach 空间等价于依范数收敛的级数都收敛",
  "A Banach space is equivalent to the convergence of series that converge in norm",
  hypotheses: ([$X$ 是#nvs],),
)[
  $X$ 是#bs; $arrow.l.r.double$ 对于 $X$ 中的任意序列 ${x_n}_(n=1)^infinity$, 如果级数 $sum_(n=1)^infinity ||x_n||$ 收敛, 则级数 $sum_(n=1)^infinity x_n$ 在 $X$ 中收敛.
]

== 线性算子

#定义(
  uuid: "BoundedLinearOperator",
  "有界线性算子",
  "Bounded Linear Operator",
  isPredicate: true,
  hypotheses: ([$X$ 是#nvs, $Y$ 是#nvs], [$T: X arrow Y$ 是线性映射]),
  notation: [$T : Blo(X, Y)$],
  [$T$ 是*有界线性算子*],
)[
  There exists a constant $C >= 0$ such that $forall x : X, ||T x||_Y <= C||x||_X$
]
#定义(
  uuid: "BoundedLinearFunctional",
  "有界线性泛函",
  "Bounded Linear Functional",
  isPredicate: true,
  isExtension: true,
  hypotheses: ([$X$ 是#nvs], [$T: X arrow bb(R)$ 是线性映射]),
  [$T$ 是*有界线性泛函*],
)[
  $T$ 是#有界线性算子.
]

#注[
  等价地, #有界线性算子 $T$ 将单位闭球映到像空间中的半径不超过 $C$ 的单位闭球中.
]

#定义(
  "有界线性算子的范数",
  "Norm of a bounded linear operator",
  hypotheses: ([$X$ 是#nvs, $Y$ 是#nvs], [$T: X arrow Y$ 是#有界线性算子]),
  [$T$ 的范数],
)[
  定义 $T$ 的范数为 $||T|| = inf{C >= 0 : forall x : X, ||T x||_Y <= C||x||_X}$.
]

#定理(
  [$Blo(X, Y)$ 成为 #bs 的条件],
  "Condition for the operator space to be a Banach space",
  hypotheses: ([$X$ 是#nvs, $Y$ 是#nvs], [$T: X arrow Y$ 是#有界线性算子]),
)[
  $Blo(X, Y)$ 是 #bs; $arrow.l.r.double$ $Y$ 是 #bs.
]

#性质(
  "有界线性算子列保持范数收敛性",
  "",
  hypotheses: (
    [$X$ 是#nvs, $Y$ 是#nvs],
    [${T_n : X arrow Y}_(n=1)^infinity$ 是一列#有界线性算子],
    [$||T_n-T|| arrow 0$],
  ),
)[
  $||T_n|| arrow ||T||$
]

#性质(
  "有界线性算子列保持逐点收敛性",
  "",
  hypotheses: (
    [$X$ 是#nvs, $Y$ 是#nvs],
    [${T_n : X arrow Y}_(n=1)^infinity$ 是一列#有界线性算子],
    [$||T_n-T|| arrow 0$],
  ),
)[
  $forall x: X, T_n x arrow T x$
]

#定理(
  "有界线性算子等价于连续线性算子",
  "Bounded linear operators are equivalent to continuous linear operators",
  hypotheses: ([$X$ 是#nvs, $Y$ 是#nvs], [$T: X arrow Y$ 是线性映射]),
)[
  $T$ 是#有界线性算子; $arrow.l.r.double$ $T$ #continuous.
]

#注[
  证明详见【数学分析III】教材.

  提示: $arrow.l.double$: $||T tilde(x)||<=frac(epsilon, delta), forall ||tilde(x)|| <= 1, tilde(x)=frac(x, delta)$.

  $arrow.double$: $||T x||<=epsilon$ whenever $||x||<=delta:=frac(epsilon, ||T x||_(max))$.
]

#注[
  直观上理解, 有界线性算子是那些不会将小向量映射成大向量的线性映射. 这与连续性的定义相吻合, 因为连续性要求对于任意小的输入变化, 输出也必须有相应的小的变化.

  事实上, #有界线性算子;不仅是连续的, 还是 Lipschitz 连续的, 因为 $||T x - T y|| = ||T(x-y)|| <= ||T|| ||x-y||$.

  在有限维的情形下所有线性算子都是有界的，因此都是连续的.
]

#例(
  "微分算子在无限维空间上是无界线性算子",
  "Unbounded linear operators on infinite-dimensional spaces",
)[
  定义 $T: Cont([0,1], bb(R)) arrow Cont([0,1], bb(R))$ 通过 $T f(x) = f'(x)$, 其中 $Cont([0,1], bb(R))$ 配备上确界范数. 则 $T$ 是一个线性算子, 但它不是有界的. 因为对于函数列 $f_n(x) = x^n$, $||f_n||_infinity = 1$, 但 $||T f_n||_infinity = ||f_n'||_infinity = n arrow infinity$.
]

#性质(
  "有界线性算子的复合仍是有界线性算子",
  "Composition of bounded linear operators is still a bounded linear operator",
  hypotheses: (
    [$X$ 是#nvs, $Y$ 是#nvs, $Z$ 是#nvs],
    [$T: : Blo(X, Y)$],
    [$S: : Blo(Y, Z)$],
  ),
)[
  $S compose T: X arrow Z$ 是#有界线性算子, 且 $||S compose T|| <= ||S|| dot ||T||$.
]

#注[
  Let $||x||=1$.
  $ || S T || = sup {||S(T x)||} = sup {||S y||} <= ||S|| ||T|| ||x|| $
]

#例(
  "全体矩阵空间",
  "The space of all matrices",
)[
  全体矩阵 $M_(m times n) (bb(R)) tilde.equiv scr(B) (bb(R)^n, bb(R)^m)$ 是 Banach 空间, 其范数定义为算子范数 $||A|| = sup_(||x||=1) ||A x||$.
]

#例(
  "序列空间上的有界线性算子",
  "Bounded linear operators on sequence spaces",
)[
  $Lambda: ell^p arrow ell^p$ 定义为 $Lambda(x_1, x_2, ...) = (lambda_1 x_1, lambda_2 x_2, dots)$ 是有界线性算子, 其范数为 $||Lambda|| = limits(sup)_(||x||=1) ||Lambda x||$.
  #linebreak()
  Factually, $Phi: ell^infinity arrow scr(B) (ell^p), {lambda_j} mapsto Lambda$ is an *isometric* isomorphism, where $Lambda(x_1, x_2, ...) = (lambda_1 x_1, lambda_2 x_2, ...)$.
]

#注[
  直观上理解, 我们将有限维的对角矩阵算子扩展到了无穷维, 当且仅当它的对角线元素是可和的.
]

#例(
  "序列空间上的移位算子",
  "Shift operators / Fredholm operators on sequence spaces",
)[
  $ell^p$ 上的左移和右移算子是有界线性算子, 其范数为 $1$. 其中 $L$ 是满射, $R$ 是单射. $dim ker L=1$.
]

#注[
  这说明存在线性满射具有非平凡核空间的情况, 也存在线性单射不是线性满射的情况, 这与有限维空间中的情况不同.
]

#例(
  "积分算子",
  "Integral operators",
)[
  积分算子: $I:C[0,1] arrow C[0,1], f mapsto integral_0^x f(y) dif y$ 是有界线性算子, 其范数为 $1$.
]

#定理(
  "有界线性算子的逆也是有界线性算子",
  "The inverse of a bounded linear operator is also a bounded linear operator",
  hypotheses: ([$X$ 是 #bs], [$T: Blo(X, X)$ 是双射]),
)[
  $T^(-1): X arrow X$ 是#有界线性算子.
]

#结构(
  "Banach 代数",
  "Banach Algebra",
  isPredicate: true,
  [#线性空间 $A$ 上的乘法使 $A$ 成为*Banach 代数*],
  (
    (
      name: [代数结构],
      name_en: [Algebraic Structure],
      value: [
        $A$ 配备一个二元运算 $dot : A times A arrow A$, 满足结合律 $(x dot y) dot z = x dot (y dot z)$, 分配律 $x dot (y + z) = x dot y + x dot z$ 和 $(x + y) dot z = x dot z + y dot z$, 以及存在单位元 $e$ 使得 $e dot x = x dot e = x$.
      ],
    ),
    (
      name: [范数性质],
      name_en: [Norm Properties],
      value: [
        $exists M > 0$, $||x dot y|| <= M ||x|| ||y||$ 和 $||e|| = 1$.
      ],
    ),
  ),
)

#例(
  "连续函数空间上的 Banach 代数",
  "Banach algebra of continuous functions",
)[
  设 $X$ 是#compact;度量空间, $Cont(X, bb(R))$ 定义为所有在 $X$ 上连续的实值函数, 配备上确界范数 $||f||_infinity = sup_(x : X) |f(x)|$. 则 $(Cont(X, bb(R)), ||dot||_infinity)$ 是 Banach 代数, 其乘法定义为函数的逐点乘积: $(f dot g)(x) = f(x) g(x)$.

  这是一个交换的 Banach 代数.
]

== 有界线性算子的谱理论

#定义(
  uuid: "Spectrum",
  "谱",
  "Spectrum",
  isPredicate: true,
  hypotheses: ([$X$ 是#nvs], [$T: Blo(X, X)$ 是有界线性算子]),
  notation: [$Spec(T)$],
  [$T$ 的谱],
)[
  ${lambda in bb(C) : T - lambda I "不是可逆的"}$.
]

#定义(
  "特征值",
  "Eigenvalue",
  hypotheses: ([$X$ 是#nvs], [$T: Blo(X, X)$ 是有界线性算子]),
  [$T$ 的特征值],
)[
  $lambda in bb(C)$ 满足 $exists x eq.not 0$ 使得 $T x = lambda x$.
]
#定义(
  "特征向量",
  "Eigenvector",
  hypotheses: ([$X$ 是#nvs], [$T: Blo(X, X)$ 是有界线性算子]),
  isPredicate: true,
  isExtension: true,
  [$T$ 的特征向量],
)[
  $x:X$ such that $T x = lambda x$.
]

#注[
  "逆映射不存在" 其实包括两种情形:
  1. 不是单射: 存在 $x eq.not 0$ 使得 $(T - lambda I)x = 0$.
  2. 不是满射: $T - lambda I$ 的像不是整个空间 $X$, 即 $exists y in X$ 使得 $forall x in X$, $(T - lambda I)x eq.not y$.
]

#注[
  这与我们在线性代数中定义的特征值有区别, 在无限维空间中, 可能存在没有特征值但仍然有谱的情况. 例如, 左移算子 $L$ 在 $ell^p$ 上没有特征值, 但其谱是单位闭盘 ${lambda in bb(C) : |lambda| <= 1}$.
]

#定理(
  "有界线性算子的谱是非空的紧集",
  "The spectrum of a bounded linear operator is non-empty",
  hypotheses: ([$X$ 是#nvs], [$T: Blo(X, X)$ 是有界线性算子]),
)[
  $sigma(T) eq.not emptyset$, 且 $sigma(T)$ 在 $bb(C)$ 中#compact.
]

== 有限维空间的特殊性质

#定义(
  uuid: "DualSpace",
  "对偶空间",
  "Dual Space",
  isPredicate: false,
  hypotheses: ([$X$ 是#nvs],),
  notation: [$X^*$],
  [$X$ 的对偶空间],
)[
  $X^* = Blo(X, bb(R))$.
]

#注[
  这里的对偶空间是指 Banach 空间的对偶空间, 不是线性代数中的对偶空间. 线性代数中的对偶空间是指所有线性泛函的集合, 而 Banach 空间的对偶空间是指所有#有界线性泛函;的集合. 只有当 $X$ 是有限维空间时, 两者才相同. 这是因为有限维的线性泛函一定是有界的, 但无限维的线性泛函不一定是有界的.
]

#定理(
  uuid: "FiniteDimensionalDualIsomorphism",
  "有限维空间的对偶空间同构于原空间",
  "The dual space of a finite-dimensional space is isomorphic to the original space",
  hypotheses: ([$V$ 是#nvs, $dim (V) < infinity$],),
)[
  $V^* tilde.equiv V$.
]

#定理(
  uuid: "FiniteDimensionalIsomorphism",
  "有限维空间同构定理",
  "Isomorphism theorem for finite-dimensional spaces",
  hypotheses: ([$V$ 是#nvs, $dim (V) < infinity$],),
)[
  $V tilde.equiv bb(R)^(dim (V))$.
]

#注[
  这里的同构是作为#nvs;的同构.
]

#定义(
  uuid: "EquivalentNorms",
  "范数的等价",
  "Equivalent Norms",
  isPredicate: true,
  hypotheses: ([$(V, ||dot||_1)$ 是#nvs], [$(V,||dot||_2)$ 是#nvs]),
  [$||dot||_1$ 和 $||dot||_2$ 是*等价的*],
)[
  $exists C_1, C_2 >= 0$: $forall x : V, C_1 ||x||_1 <= ||x||_2 <= C_2 ||x||_1$.
]

#定理(
  "有限维空间上的任意两个范数都是等价的",
  "Any two norms on a finite-dimensional space are equivalent",
  hypotheses: ([$V$ 是#nvs], [$dim (V) < infinity$], [$||dot||_1$ 和 $||dot||_2$ 是 $V$ 上的范数]),
)[
  $||dot||_1$ 和 $||dot||_2$ 是等价的.
]

#定义(
  uuid: "HeineBorelProperty",
  "Heine-Borel 性质",
  "Heine-Borel Property",
  isPredicate: true,
  hypotheses: ([$X$ 是#nvs],),
  [$X$ 满足*Heine-Borel 性质*],
)[
  $X$ 中的任意有界#闭集;都是#compact;的.
]

#定理(
  "赋范线性空间是有限维的当且仅当它满足 Heine-Borel 性质",
  "A normed vector space is finite-dimensional iff it satisfies the Heine-Borel property",
  hypotheses: ([$X$ 是#nvs],),
)[
  $X$ 满足 Heine-Borel 性质; $arrow.l.r.double$ $X$ 是有限维的.
]

#定理(
  "无限维 Banach 空间中的单位球不是紧的",
  "The unit ball in an infinite-dimensional Banach space is not compact",
  hypotheses: ([$X$ 是#bs], [$dim (X) = infinity$]),
)[
  $cal(B) = {x : X : ||x|| <= 1}$ 不是#compact;的.
]

#定义(
  uuid: "BidualSpace",
  "双对偶空间",
  "Bidual Space",
  isPredicate: false,
  hypotheses: ([$X$ 是#nvs],),
  notation: [$X^(**)$],
  [$X$ 的双对偶空间],
)[
  $X^(**) = (X^*)^* = Blo(X^*, bb(R))$.
]

#性质(
  "原空间是双对偶空间的子空间",
  "The original space is a subspace of the bidual space",
  hypotheses: ([$X$ 是#nvs],),
)[
  $exists J: X arrow.r.hook X^(**)$ 使得 $forall x : X, forall f : X^*, J(x)(f) = f(x)$.

  称 $J$ 为 $X$ 的*典范嵌入*.
]

#定义(
  uuid: "ReflexiveSpace",
  "自反空间",
  "Reflexive Space",
  isPredicate: true,
  hypotheses: ([$X$ 是#nvs], [$J$ 是 $X$ 的典范嵌入]),
  [$X$ 是*自反空间*],
)[
  $J$ 是双射.
]

#注[
  即使 $X$ 与 $X^(**)$ 同构也不能说明 $X$ 的典范嵌入是同构.
]

#例(
  "Lp 空间是自反空间的充要条件",
  "",
)[
  $L^p$ 空间是自反空间当且仅当 $1 < p < infinity$.
]

= 线性泛函分析基础

== Hahn-Banach 定理

#结构(
  uuid: "Seminorm",
  "半范数",
  "Seminorm",
  isPredicate: true,
  [#线性空间 $V$ 上的函数 $p: V arrow bb(R)$ 是 $V$ 上的*半范数函数*],
  (
    (
      name: [非负性],
      name_en: [Non-negativity],
      value: [
        $forall x : V, p(x) >= 0$,
      ],
    ),
    (
      name: [绝对齐次性],
      name_en: [Absolute Homogeneity],
      value: [
        $forall lambda : bb(R), x : V: p(lambda x) = |lambda| p(x)$,
      ],
    ),
    (
      name: [次可加性 / 三角不等式],
      name_en: [Subadditivity / Triangle Inequality],
      value: [
        $forall x,y : V, p(x+y) <= p(x) + p(y)$,
      ],
    ),
  ),
)

#注[
  #半范数;相较于范数不具有正定性. 可能 $exists x : V, x eq.not 0$ 使得 $p(x) = 0$.
]

#性质(
  "半范数的零空间是线性子空间",
  "The zero set of a seminorm is a linear subspace",
  hypotheses: ([$V$ 是#线性空间], [$p$ 是 $V$ 上的#半范数]),
)[
  $Z := {x : V : p(x) = 0}$ 是 $V$ 的线性子空间.
]

#性质(
  "半范数可以诱导范数",
  "A seminorm can induce a norm",
  hypotheses: ([$V$ 是#线性空间], [$p$ 是 $V$ 上的#半范数], [$Z$ 是 $p$ 的零空间]),
)[
  定义 $||x + Z|| = p(x)$, 则 $||dot||$ 是 $V/Z$ 上的范数, 使得 $V/Z$ 成为一个赋范线性空间.
]

#定义(
  "紧致组",
  "Compact Exhuastion",
  isPredicate: false,
  hypotheses: ([$X$ 是#nvs],),
  [$X$ 的*紧致组*],
)[
  一列#compact;集 ${K_n}_(n=1)^infinity$ 满足 $K_n subset.eq K_(n+1)$ 和 $union_(n=1)^infinity K_n = X$.
]

#定义(
  "紧致收敛拓扑",
  "Compact convergence topology",
  isPredicate: false,
  hypotheses: ([$X$ 是#nvs], [$T: X arrow Y$ 是线性映射], [${K_n}_(n=1)^infinity$ 是 $X$ 的紧致组]),
  [$T$ 的*紧致收敛拓扑*],
)[
  $ ||f||_i = sup_(x in K_i) |f(x)| $

  则 ${||f||_i}$ 是一族#半范数. 定义

  $ rho(f, g) = sum_(i=1)^infinity 2^(-i) frac(||f-g||_i, 1+||f-g||_i) $

  则 $rho$ 是 $Cont(X, RR)$ 上的一个度量, 称为*紧致收敛度量*, 其诱导的拓扑叫做*紧致收敛拓扑*.
]

#定义(
  uuid: "SublinearFunctional",
  "次线性泛函",
  "Sublinear Functional",
  isPredicate: true,
  hypotheses: ([$V$ 是#线性空间],),
  [$V$ 上的*次线性泛函*],
)[
  $f: V arrow bb(R)$ 满足以下条件:
  1. *正齐次性 (Positive Homogeneity)*: $forall lambda >= 0, x : V, f(lambda x) = lambda f(x)$.
  2. *次可加性 (Subadditivity)*: $forall x,y : V, f(x+y) <= f(x) + f(y)$.
]

#定理(
  "Hahn-Banach 定理",
  "Hahn-Banach Theorem",
  hypotheses: (
    [$X$ 是一个实向量空间],
    [$Y$ 是 $X$ 的一个子空间],
    [$p: X -> RR$ 是一个次线性泛函],
    [$f: Y -> RR$ 是一个线性函数],
    [$forall y:Y, f(y) <= p(y)$],
  ),
)[
  $exists F: X -> RR$ 使得 $forall y:Y, F(x) = f(x) and forall x:X, F(x) <= p(x)$
]

#注[
  这个定理的意义在于, 在满足某些条件的情况下, 可以将一个定义在子空间上的线性函数(i)扩展到整个空间上, (ii)同时保持被某个次线性函数的控制.
]

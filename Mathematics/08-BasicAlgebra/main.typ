#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../03-TypeTheory/main.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "export.typ": *

#show : FulcrumCN
#show : SetStyle

#let 看不看范畴论 = state("CategoryTheoryVisible", true)
#let 我不看范畴论 = context {
  看不看范畴论.update(false)
  []
}

#我不看范畴论

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[基础代数学])
]

= 群论

#约定[
  - $G : Type$
  - $("_" dot "_") : G -> G -> G$
]

== 基本定义

#定义条目("半群", "Semigroup", uuid: "Semigroup")[
  #结构子句(
    主体: [$(G, dot)$ 是#半群],
    isPredicate: true,
    成员: (
      (name: [结合律], name_en: [Associativity], value: [$forall (a, b, c : G), (a dot b) dot c = a dot (b dot c)$]),
    ),
  )
]

#注条目("", "")[通常书写时省略乘号“$dot$”，即将 $a dot b$ 写作 $a b$。]

#定义条目("自然数幂", "NatPower")[
  #定义子句(
    条件: ([$(G, dot)$ 是#半群], $a : G$, $n : bb(N)$),
    主体: [$a$ 的 $n$ 次幂],
    bstyle: "display",
    内容: [
      对 $n$ 进行归纳，
      - 若 $n = 0$，$e$；
      - 若 $n = m + 1$，$a dot a^m$,
    ],
  )
]

#定义条目("幺半群", "Monoid", uuid: "Monoid")[
  #结构子句(
    主体: [$(G, dot)$ 是#幺半群],
    extends: ([#半群],),
    成员: (
      (name: [单位元], name_en: [Identity], varName: $e$, value: $G$),
      (name: [单位元左乘不变性], value: [$forall (a : G), e dot a = a$]),
      (name: [单位元右乘不变性], value: [$forall (a : G), a dot e = a$]),
    ),
  )
]

#注条目("", "")[
  - “单位元”又称“幺元”或“恒等元”
]

#性质条目("幺半群中单位元唯一", "", uuid: "MonoidIdentityUnique")[
  #定理子句(
    条件: ([$(G, dot)$ 是#幺半群], $e' : G$, $forall a : G, e'a = a and a e' = a$),
    结论: [$e' = e$],
  )
]

#定义条目("群", "Group", uuid: "Group")[
  #结构子句(
    主体: [$(G, dot)$ 是#群],
    extends: ([#幺半群],),
    成员: (
      (name: [逆元], name_en: [Inverse], varName: $dot^(-1)$, value: $G -> G$),
      (name: [逆元左乘律], value: [$forall (a : G), a^(-1) dot a = e$]),
      (name: [逆元右乘律], value: [$forall (a : G), a dot a^(-1) = e$]),
    ),
  )
]

== 同态

#约定[
  - $G, H : Type$
  - $dot_G : G -> G -> G$
  - $dot_H : H -> H -> H$
  - $(G, dot_G), (H, dot_H)$ 是#群
  - $f : G -> H$
]

#定义条目("群同态", "Group Homomorphism", uuid: "GroupHomomorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的#群同态],
    isPredicate: true,
    成员: (
      (name: [保持恒等元], value: [$f(e_G) = e_H$]),
      (name: [保持乘法], value: [$forall (a, b : G), f(a dot_G b) = f(a) dot_H f(b)$]),
    ),
    记号: [$GHom(G, H)$],
  )
]

#性质条目("群同态等价定义", "", uuid: "GroupHomomorphismIff")[
  #定理子句(
    条件: ([$forall a,b : G,$],),
    结论: [$GHom(G, H)$],
  )
]

#定义条目("群单同态", "Group Monomorphism", uuid: "GroupMonomorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的群单同态],
    extends: ([$f$ 是#群同态],),
    成员: (
      (name: [单射], value: [$f$ 是单射]),
    ),
    记号: [$G GMono H$],
  )
]

#定义条目("群满同态", "Group Epimorphism", uuid: "GroupEpimorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的群满同态],
    extends: ([$f$ 是#群同态],),
    成员: (
      (name: [满射], value: [$f$ 是满射]),
    ),
    记号: [$G GEpi H$],
  )
]

#定义条目("群同构", "Group Isomorphism", uuid: "GroupIsomorphism")[
  #结构子句(
    主体: [$G$ 到 $H$ 的群同构],
    条件: ([#link(<GroupMonomorphism>, [同上])],),
    extends: ([#群同态],),
    成员: (
      (name: [同态], varName: [$f,g$], value: [$GHom(G,H)$]),
      (name: [互逆], value: [$f compose g = g compose f = 1$]),
    ),
    记号: [$G GIso H$],
  )
]

#性质条目("群双射是同构", "", uuid: "GroupBijectionIsomorphism")[
  #定理子句(
    条件: ([$f : GHom(G, H)$, $f$ 是双射],),
    结论: [$G GIso H$],
  )
]

== 子群

#约定[
  - $G : Type$
  - $dot_G : G -> G -> G$
  - $(G, dot_G)$ 是#群
]

#let SubG = $#optionLink("Subgroup", $<=$)$
#let PSubG = $#optionLink("ProperSubgroup", $<$)$

#定义条目("子群", "Subgroup", uuid: "Subgroup")[
  #定义子句(
    条件: ([$H : Set(G)$],),
    主体: [$H$ 是 $G$ 的子群],
    isPredicate: true,
    内容: [$(H, dot_G)$ 是#群],
    记号: [$H SubG G$],
  )
]

#定义条目("真子群", "Proper Subgroup", uuid: "ProperSubgroup")[
  #定义子句(
    条件: (link(<Subgroup>, [同上]),),
    主体: [$H$ 是 $G$ 的真子群],
    isPredicate: true,
    内容: [$H SubG G and H != G$],
    记号: [$H PSubG G$],
  )
]

#性质条目([平凡子群], [Trivial Subgroup], uuid: "TrivialSubgroup")[
  #定理子句(
    结论: $ #structProp(
      (name: "1 子群", value: $(1, dot) SubG G$),
      (name: "全子群", value: $(G, dot) SubG G$)
    ) $,
    cstyle: "display",
  )
]


== 置换群

#约定[
  - $X : Type$
]

#定义条目("置换", "Permutation")[
  // TODO: 集合 $X$ 上的置换, 即 $X -> X$ 的双射。
]

#定义条目("对称群", "Symmetric Group")[
  // TODO: $X$ 上全体置换在复合运算下构成的群 $"Sym"(X)$。
  // 当 $X = {1, ..., n}$ 时记为 $S_n$。
]

#定义条目("轮换", "Cycle")[
  // TODO: $r$ 阶轮换 $(a_1, a_2, ..., a_r)$ 的定义。
]

#定义条目("不交轮换", "Disjoint Cycles")[
  // TODO: 两个轮换作用的元素集合不相交。
]

#定理条目("轮换分解定理", "Cycle Decomposition")[
  // TODO: 任何置换可唯一分解为不交轮换的乘积（不计顺序）。
]

#定义条目("对换", "Transposition")[
  // TODO: 2 阶轮换。
]

#定义条目("奇置换", "Odd Permutation")[
  // TODO: 可表示为奇数个对换乘积的置换。
]
#定义条目("偶置换", "Even Permutation", isExtension: true)[
  // TODO: 可表示为偶数个对换乘积的置换。
]

#性质条目("奇偶性不依赖于分解", "")[
  // TODO: 其同一置换不同的对换分解的長度奇偶性相同。
]

#定义条目("交错群", "Alternating Group")[
  // TODO: $S_n$ 中所有偶置换构成的子群 $A_n$。
]

#定理条目("Cayley 定理", "Cayley")[
  // TODO: 任何群 $G$ 同构于 $"Sym"(G)$ 的子群。
]


== 群作用

#约定[
  - $G : Type$
  - $X : Type$
  - $(G, dot)$ 是#群
]

#定义条目("群作用", "Group Action")[
  // TODO: 运算 $alpha : G -> X -> X$ 满足单位元作用与结合律。
]

#定义条目("轨道", "Orbit")[
  // TODO: $x in X$ 的轨道 $G dot x = { g dot x | g in G }$。
]

#定义条目("稳定子群", "Stabilizer")[
  // TODO: $"Stab"(x) = { g in G | g dot x = x }$，$G$ 的子群。
]

#性质条目("轨道是集合的等价类", "")[
  // TODO: 对 $X$ 定义关系 $x tilde y$ 以 $exists g, g dot x = y$, 为等价关系。
  // $X$ 以轨道为等价类。
]

#定理条目("轨道-稳定子定理", "Orbit-Stabilizer")[
  // TODO: 有限群 $G$ 作用于 $X$, $forall x in X$, $|G dot x| dot |"Stab"(x)| = |G|$。
]

#定义条目("不动点集", "Fixed Point Set")[
  // TODO: $X^g = { x in X | g dot x = x }$。
]

#引理条目("Burnside 计数引理", "Burnside")[
  // TODO: 有限群 $G$ 作用于有限集 $X$, 轨道数 $|X \/ G| = (1 / |G|) sum_(g in G) |X^g|$。
]

#定义条目("共轭作用", "Conjugation Action")[
  // TODO: $G$ 作用于自身: $g dot x = g x g^(-1)$。
]

#定义条目("共轭类", "Conjugacy Class")[
  // TODO: 共轭作用下的轨道。
]

#定义条目("中心化子", "Centralizer")[
  // TODO: $C_G(x) = { g in G | g x = x g }$，即共轭作用的稳定子群。
]

#定义条目("中心", "Center")[
  // TODO: $Z(G) = { g in G | forall x in G, g x = x g }$，$G$ 的交换中心子群。
]

#定理条目("类方程", "Class Equation")[
  // TODO: 有限群 $|G| = |Z(G)| + sum_i [G : C_G(x_i)]$，其中求和跨非心共轭类代表。
]


#context if 看不看范畴论.get() [

== 群范畴

#定义条目("群范畴", "Category of Groups")[
  // TODO: 范畴 $bold("Grp")$, 对象为一切群, 态射为群同态。
]

#性质条目("群范畴中的同构", "")[
  // TODO: $bold("Grp")$ 中同构 即 群同构。
]

#定义条目("群直积", "Direct Product of Groups")[
  // TODO: $G times H$ 上的逐分量乘法, 为 $bold("Grp")$ 中的积。
]

#定义条目("群余积", "Coproduct in Group Category")[
  // TODO: $bold("Grp")$ 中的余积 即 自由积 G * H。
]

#性质条目("群范畴是完备与余完备的", "")[
  // TODO: $bold("Grp")$ 有全部小极限与小余极限。
]

]

= 环论

#约定[
  - $R : Type$
  - $("_" + "_") : R -> R -> R$
  - $("_" dot "_") : R -> R -> R$
]


== 基本定义

#定义条目("环", "Ring", uuid: "Ring")[
  // TODO: $(R, +, dot)$, 其中 $(R, +)$ 是阿贝尔群, $(R, dot)$ 是半群 (不要求单位元), 且乘法对加法满足左右分配律。
]

#注条目("", "")[
  - 本笔记中“环”默认 *不* 要求含幺; 含幺的环另设为“幺环”。典型例如 $2 ZZ$ 是环, 但不是幺环。
  - 通常省去乘号 $dot$, 把 $a dot b$ 简写为 $a b$。
]

#定义条目("交换环", "Commutative Ring", uuid: "CommutativeRing")[
  // TODO: 乘法满足交换律的环。
]

#定义条目("幺环", "Unital Ring", uuid: "UnitalRing")[
  // TODO: 乘法上存在单位元 $1 in R$ 的环; 等价于 $(R, dot)$ 是幺半群。
]

#定义条目("交换幺环", "Commutative Unital Ring", uuid: "CommutativeUnitalRing")[
  // TODO: 同时为交换环与幺环。
]

#定义条目("零环", "Zero Ring", uuid: "ZeroRing")[
  // TODO: 只含一个元素的幺环 $\{0\}$, 其中 $0 = 1$。
]

#性质条目("环中乘法零元吸收律", "")[
  // TODO: $forall a in R$, $0 dot a = a dot 0 = 0$。
]

#性质条目("环中加法逆元与乘法相容", "")[
  // TODO: $forall a, b in R$, $(-a) dot b = a dot (-b) = -(a dot b)$。
]


== 特殊元素

#定义条目("单位 / 可逆元", "Unit", uuid: "Unit")[
  // TODO: 设 $R$ 是幺环。 $u in R$ 称为单位, 当且仅当存在 $v in R$ 使 $u v = v u = 1$。
]

#定义条目("单位群", "Group of Units", uuid: "UnitGroup")[
  // TODO: 幺环 $R$ 中全体单位构成的乘法群, 记作 $R^times$。
]

#定义条目("零因子", "Zero Divisor", uuid: "ZeroDivisor")[
  // TODO: 非零元 $a in R$ 称为左(右)零因子, 若存在非零 $b in R$ 使 $a b = 0$ ($b a = 0$)。
]

#定义条目("幂零元", "Nilpotent", uuid: "Nilpotent")[
  // TODO: $a in R$ 称为幂零, 若存在 $n in NN$ 使 $a^n = 0$。
]

#定义条目("幂等元", "Idempotent", uuid: "Idempotent")[
  // TODO: $a in R$ 称为幂等, 若 $a^2 = a$。
]


== 整环 / 体 / 域

#定义条目("整环", "Integral Domain", uuid: "IntegralDomain")[
  // TODO: 无零因子的非零交换幺环。
]

#定义条目("除环 / 体", "Division Ring", uuid: "DivisionRing")[
  // TODO: 非零元全可逆的幺环 (不要求交换)。
]

#定义条目("域", "Field", uuid: "Field")[
  // TODO: 交换的除环。
]

#定义条目("环的特征", "Characteristic", uuid: "RingCharacteristic")[
  // TODO: 在幺环 $R$ 中, 满足 $n dot 1 = 0$ 的最小正整数 $n$; 若不存在则规定 $"char"(R) = 0$。
]

#性质条目("整环的特征是 0 或素数", "")[
  // TODO: $R$ 是整环 $==> "char"(R) in \{0\} union {素数}$。
]


== 子环与理想

#定义条目("子环", "Subring", uuid: "Subring")[
  // TODO: $S subset.eq R$ 在加法与乘法下封闭; 在幺环情形还要求 $1 in S$。
]

#定义条目("左理想", "Left Ideal", uuid: "LeftIdeal")[
  // TODO: $I subset.eq R$ 是加法子群, 且 $R I subset.eq I$。
]

#定义条目("右理想", "Right Ideal", uuid: "RightIdeal", isExtension: true)[
  // TODO: $I subset.eq R$ 是加法子群, 且 $I R subset.eq I$。
]

#定义条目("双边理想 / 理想", "Two-sided Ideal", uuid: "TwoSidedIdeal", isExtension: true)[
  // TODO: 同时为左、右理想; 在交换环中三者等同, 简称理想。
]

#定义条目("真理想", "Proper Ideal", uuid: "ProperIdeal")[
  // TODO: 不等于整个 $R$ 的理想。
]

#定义条目("由集合生成的理想", "Ideal Generated by a Set", uuid: "IdealGenerated")[
  // TODO: 包含给定子集 $S subset.eq R$ 的最小理想, 记作 $angle.l S angle.r$。
]

#定义条目("主理想", "Principal Ideal", uuid: "PrincipalIdeal")[
  // TODO: 由单个元素生成的理想 $(a) = R a$ (交换环情形)。
]

#定义条目("素理想", "Prime Ideal", uuid: "PrimeIdeal")[
  // TODO: 真理想 $P$, 满足 $a b in P ==> a in P or b in P$。
]

#定义条目("极大理想", "Maximal Ideal", uuid: "MaximalIdeal")[
  // TODO: 真理想 $M$, 不被任何真理想真包含。
]

#性质条目("极大理想是素理想", "")[
  // TODO: 在交换幺环中, $M$ 极大 $==> M$ 素。
]


== 理想运算

#定义条目("理想的和", "Sum of Ideals", uuid: "IdealSum")[
  // TODO: $I + J = \{ a + b | a in I, b in J \}$, 仍是理想。
]

#定义条目("理想的积", "Product of Ideals", uuid: "IdealProduct")[
  // TODO: $I J = angle.l \{ a b | a in I, b in J \} angle.r$, 仍是理想。
]

#定义条目("理想的交", "Intersection of Ideals", uuid: "IdealIntersection")[
  // TODO: $I sect J$ 是理想。
]

#性质条目("理想运算的包含关系", "")[
  // TODO: $I J subset.eq I sect J subset.eq I + J$。
]


== 商环

#构造条目("商环的构造", "Quotient Ring Construction", uuid: "QuotientRingConstruction")[
  // TODO: 给定理想 $I$, 在 $R$ 上定义等价关系 $a tilde b iff a - b in I$, 得商集 $R \/ I$, 以陪集运算 $(a + I) + (b + I) = (a + b) + I$, $(a + I)(b + I) = (a b) + I$ 配成环。
]

#定义条目("商环", "Quotient Ring", uuid: "QuotientRing")[
  // TODO: 由理想 $I$ 决定的商环 $R \/ I$。
]

#性质条目("商环是域当且仅当理想极大", "")[
  // TODO: $R$ 交换幺环, $M lt.tri R$: $R\/M$ 是域 $iff M$ 极大。
]

#性质条目("商环是整环当且仅当理想素", "")[
  // TODO: $R$ 交换幺环, $P lt.tri R$: $R\/P$ 是整环 $iff P$ 素。
]


== 环同态

#定义条目("环同态", "Ring Homomorphism", uuid: "RingHomomorphism")[
  // TODO: $f : R -> S$ 保加法、保乘法; 在幺环之间还要求 $f(1_R) = 1_S$。
]

#定义条目("环同态的核", "Kernel", uuid: "RingHomKernel")[
  // TODO: $ker(f) = \{ a in R | f(a) = 0 \}$, 是 $R$ 的双边理想。
]

#定义条目("环同态的像", "Image", uuid: "RingHomImage", isExtension: true)[
  // TODO: $"im"(f) = \{ f(a) | a in R \}$, 是 $S$ 的子环。
]

#定义条目("环同构", "Ring Isomorphism", uuid: "RingIsomorphism")[
  // TODO: 双射环同态。
]

#定理条目("环第一同构定理", "First Isomorphism Theorem")[
  // TODO: $f : R -> S$ 环同态 $==> R \/ ker(f) tilde.equiv "im"(f)$。
]

#定理条目("环第二同构定理", "Second Isomorphism Theorem")[
  // TODO: $S$ 子环, $I$ 理想 $==> (S + I) \/ I tilde.equiv S \/ (S sect I)$。
]

#定理条目("环第三同构定理", "Third Isomorphism Theorem")[
  // TODO: $I subset.eq J$ 均为理想 $==> (R \/ I) \/ (J \/ I) tilde.equiv R \/ J$。
]

#定理条目("理想对应定理", "Correspondence Theorem")[
  // TODO: 商映射 $pi : R -> R\/I$ 在含 $I$ 的理想与 $R\/I$ 的理想之间建立保包含的双射。
]


== 多项式环

#定义条目("多项式环", "Polynomial Ring", uuid: "PolynomialRing")[
  // TODO: 在交换幺环 $R$ 上, $R[x]$ 以 $x$ 为不定元的形式多项式集合, 配以多项式加法与乘法。
]

#定义条目("多项式的次数", "Degree of a Polynomial", uuid: "PolynomialDegree")[
  // TODO: $deg(f)$ 为最高非零项的指数; 规定 $deg(0) = -infinity$。
]

#定义条目("首一多项式", "Monic Polynomial", uuid: "MonicPolynomial")[
  // TODO: 最高次项系数为 $1$ 的多项式。
]

#性质条目("整环上多项式次数加法律", "")[
  // TODO: $R$ 整环 $==> deg(f g) = deg(f) + deg(g)$, 且 $R[x]$ 也是整环。
]

#定义条目("不可约多项式", "Irreducible Polynomial", uuid: "IrreduciblePolynomial")[
  // TODO: $R$ 整环, $f in R[x]$ 非零非单位, 且不能分解为两非单位之积。
]


== 整除与素元

#定义条目("整除", "Divides", uuid: "Divides")[
  // TODO: 设 $R$ 是幺环。 $a | b iff exists c in R, b = a c$。
]

#定义条目("素元", "Prime Element", uuid: "PrimeElement")[
  // TODO: $p$ 非零非单位, 且 $p | a b ==> p | a or p | b$。
]

#定义条目("不可约元", "Irreducible Element", uuid: "IrreducibleElement")[
  // TODO: $p$ 非零非单位, 且 $p = a b ==> a$ 或 $b$ 是单位。
]

#性质条目("整环中素元是不可约元", "")[
  // TODO: $R$ 整环: $p$ 素 $==> p$ 不可约。
]


== 主理想整环 / 唯一分解整环 / 欧几里得整环

#定义条目("欧几里得整环", "Euclidean Domain", uuid: "EuclideanDomain")[
  // TODO: 整环 $R$ 配以欧几里得范数 $delta : R \\ \{0\} -> NN$, 满足带余除法。
]

#定义条目("主理想整环", "Principal Ideal Domain", uuid: "PrincipalIdealDomain")[
  // TODO: 整环, 其每个理想都是主理想。
]

#定义条目("唯一分解整环", "Unique Factorization Domain", uuid: "UniqueFactorizationDomain")[
  // TODO: 整环, 每非零非单位元素都可唯一(在相伴与顺序意义下)分解为不可约元的乘积。
]

#性质条目("ED ==> PID ==> UFD", "")[
  // TODO: 欧几里得整环 $==>$ 主理想整环 $==>$ 唯一分解整环 (反向均不成立)。
]

#性质条目("UFD 中不可约元等价于素元", "")[
  // TODO: $R$ 是 UFD: $p$ 不可约 $iff p$ 素。
]


== 分式域

#构造条目("整环的分式域", "Field of Fractions Construction", uuid: "FieldOfFractionsConstruction")[
  // TODO: 在 $R times (R \\ \{0\})$ 上定义等价关系 $(a, b) tilde (c, d) iff a d = b c$, 商集配以分数加乘构造为域。
]

#定义条目("分式域", "Field of Fractions", uuid: "FieldOfFractions")[
  // TODO: 整环 $R$ 的分式域 $"Frac"(R)$。
]

#性质条目("分式域是包含 R 的最小域", "")[
  // TODO: 对任意 $R hook.r K$ ($K$ 域) 存在唯一环同态 $"Frac"(R) -> K$ 延拓 $R hook.r K$。
]


#context if 看不看范畴论.get() [

== 环范畴

#定义条目("环范畴", "Category of Rings", uuid: "CategoryOfRings")[
  // TODO: 范畴 $bold("Ring")$, 对象为幺环, 态射为幺环同态。
]

#性质条目("环范畴中的同构", "")[
  // TODO: $bold("Ring")$ 中同构 即 环同构。
]

#定义条目("环直积", "Direct Product of Rings", uuid: "RingDirectProduct")[
  // TODO: $R times S$ 上逐分量加乘, 为 $bold("Ring")$ 中的积。
]

#性质条目("环范畴有积无余积 (交换情形不同)", "")[
  // TODO: $bold("Ring")$ 有全部小积; 余积非平凡 (交换幺环情形为张量积 $R times.circle_ZZ S$)。
]

]

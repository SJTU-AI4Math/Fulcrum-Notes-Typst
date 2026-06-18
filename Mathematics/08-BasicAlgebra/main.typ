#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../03-TypeTheory/main.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-Logic/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../11-NumberTheory/export.typ": *
#import "export.typ": *

#show : FulcrumCN
#show : LogicStyle
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
    isPredicate: true,
    extends: ([$(G, dot)$ 是#半群],),
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
    isPredicate: true,
    extends: ([$(G, dot)$ 是#幺半群],),
    成员: (
      (name: [取逆函数], name_en: [Inverse], varName: $dot^(-1)$, value: $G -> G$),
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
    主体: [$f$ 是 $G$ 到 $H$ 的#群单同态],
    isPredicate: true,
    extends: ([$f$ 是 $G$ 到 $H$ 的#群同态],),
    成员: (
      (name: [单射性], name_en: [Injectivity], value: [$f$ 是单射]),
    ),
    记号: [$G GMono H$],
  )
]

#定义条目("群满同态", "Group Epimorphism", uuid: "GroupEpimorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的#群满同态],
    isPredicate: true,
    extends: ([$f$ 是 $G$ 到 $H$ 的#群同态],),
    成员: (
      (name: [满射性], name_en: [Surjectivity], value: [$f$ 是满射]),
    ),
    记号: [$G GEpi H$],
  )
]

#定义条目("群同构", "Group Isomorphism", uuid: "GroupIsomorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的#群同构],
    isPredicate: true,
    extends: ([$f$ 是 $G$ 到 $H$ 的#群同态],),
    成员: (
      (name: [逆同态], name_en: [Inverse Homomorphism], varName: $g$, value: $GHom(H, G)$),
      (name: [互逆性], name_en: [Two-sided Inverse], value: [$f compose g = id_H and g compose f = id_G$]),
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

#定义条目("群自同态", "Group Endomorphism", uuid: "GroupEndomorphism")[
  #定义子句(
    条件: ([~$(G, dot)$ 是#群]),
    主体: [$G$ 上的#群自同态],
    内容: [$G$ 到自身的#群同态],
    记号: $GEnd(G)$,
  )
]

#定义条目("群自同构", "Group Automorphism", uuid: "GroupAutomorphism")[
  #定义子句(
    条件: ([~$(G, dot)$ 是#群]),
    主体: [$G$ 上的#群自同构],
    内容: [$G$ 到自身的#群同构;全体在复合下构成的群],
    记号: $GAut(G)$,
  )
]

#定义条目("群同态的核", "Kernel", uuid: "GroupHomKernel")[
  #定义子句(
    条件: ([~$f : G -> H$ 是#群同态]),
    主体: [$f$ 的#群同态的核],
    内容: [#setOf($a$, type: $G$, $f(a) = e_H$)，为 $G$ 的#子群],
    记号: $GKer(f)$,
  )
]

#定义条目("群同态的像", "Image", uuid: "GroupHomImage", isExtension: true)[
  #定义子句(
    条件: ([~$f : G -> H$ 是#群同态]),
    主体: [$f$ 的#群同态的像],
    内容: [#setOf($f(a)$, $a : G$)，为 $H$ 的#子群],
    记号: $GIm(f)$,
  )
]

== 子群

#约定[
  - $G : Type$
  - $dot_G : G -> G -> G$
  - $(G, dot_G)$ 是#群
]

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

#定义条目("置换", "Permutation", uuid: "Permutation")[
  #定义子句(
    条件: ([~$X : Type$], $sigma : X -> X$),
    主体: [$sigma$ 是 $X$ 上的#置换],
    isPredicate: true,
    内容: [$sigma$ 是双射],
  )
]

#定义条目("对称群", "Symmetric Group", uuid: "SymmetricGroup")[
  #结构实例子句(
    条件: ([~$X : Type$]),
    主体: [$X$ 上的#对称群],
    类别: [#群],
    记号: $Sym(X)$,
    成员: (
      (name: [底集], value: [#setOf($sigma$, type: $X -> X$, [$sigma$ 是 $X$ 上的#置换])]),
      (name: [乘法], value: [函数复合 $compose$]),
      (name: [#单位元], value: [恒等映射 $op("id")_X$]),
      (name: [#逆元], value: [双射的逆映射]),
    ),
  )
]

#注条目("", "")[
  当 $X = { 1, 2, ..., n }$ 时，记其#对称群;为 $SymmGroup(n)$，称为 $n$ 元#对称群。
]

#定义条目("轮换", "Cycle", uuid: "Cycle")[
  #定义子句(
    条件: ([~$X : Type$], $r : bb(N)$, $r >= 2$, [$a_1, a_2, ..., a_r : X$ 两两不同]),
    主体: [由 $a_1, a_2, ..., a_r$ 决定的 $r$ 阶#轮换],
    内容: [将 $a_i$ 映为 $a_(i+1)$（$i < r$）、$a_r$ 映为 $a_1$、其余元素保持不动的#置换],
    记号: $(a_1 thin a_2 thin ... thin a_r)$,
  )
]

#定义条目("不交轮换", "Disjoint Cycles", uuid: "DisjointCycles")[
  #定义子句(
    条件: ([~$X : Type$], [$sigma_1, sigma_2$ 是 $X$ 上的#轮换]),
    主体: [$sigma_1, sigma_2$ 是#不交轮换],
    isPredicate: true,
    内容: [$sigma_1, sigma_2$ 各自所对应的 $a_i$ 元素集合#不交],
  )
]

#定理条目("轮换分解定理", "Cycle Decomposition Theorem", uuid: "CycleDecomposition")[
  #定理子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    结论: [$sigma$ 可唯一地（不计因子顺序）分解为有限多个两两#不交;的#轮换;之乘积],
  )
]

#定义条目("对换", "Transposition", uuid: "Transposition")[
  #定义子句(
    条件: ([~$X : Type$], $sigma : Sym(X)$),
    主体: [$sigma$ 是#对换],
    isPredicate: true,
    内容: [$sigma$ 是 $2$ 阶#轮换],
  )
]

#定义条目("奇置换", "Odd Permutation", uuid: "OddPermutation")[
  #定义子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    主体: [$sigma$ 是#奇置换],
    isPredicate: true,
    内容: [$sigma$ 可表为奇数个#对换;的乘积],
  )
]
#定义条目("偶置换", "Even Permutation", uuid: "EvenPermutation", isExtension: true)[
  #定义子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    主体: [$sigma$ 是#偶置换],
    isPredicate: true,
    内容: [$sigma$ 可表为偶数个#对换;的乘积],
  )
]

#性质条目("奇偶性不依赖于分解", "", uuid: "PermutationParityWellDefined")[
  #定理子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    结论: [$sigma$ 的任意两个#对换;分解的因子个数同奇偶；从而#奇置换;与#偶置换;互斥且穷尽 $Sym(X)$ 中所有元素],
  )
]

#定义条目("交错群", "Alternating Group", uuid: "AlternatingGroup")[
  #结构实例子句(
    条件: ([~$n : bb(N)$]),
    主体: [$n$ 元#交错群],
    类别: [#群],
    记号: $A_n$,
    成员: (
      (name: [底集], value: [#setOf($sigma$, type: $SymmGroup(n)$, [$sigma$ 是#偶置换])]),
      (name: [群结构], value: [继承自 $SymmGroup(n)$]),
    ),
  )
]

#定理条目("Cayley 定理", "Cayley's Theorem", uuid: "CayleyTheorem")[
  #定理子句(
    条件: ([~$(G, dot)$ 是#群]),
    结论: [存在#群单同态 $G arrow.hook Sym(G)$；即任意#群;同构于其底集上某#对称群;的#子群],
  )
]


== 群作用

#约定[
  - $G : Type$
  - $X : Type$
  - $(G, dot)$ 是#群
]

#定义条目("群作用", "Group Action", uuid: "GroupAction")[
  #结构子句(
    主体: [$alpha$ 是 $G$ 在 $X$ 上的#群作用],
    isPredicate: true,
    成员: (
      (name: [作用映射], varName: $alpha$, value: $G -> X -> X$),
      (name: [#单位元;作用平凡], value: [$forall x : X, alpha(e)(x) = x$]),
      (name: [结合律], value: [$forall (g, h : G) (x : X), alpha(g dot h)(x) = alpha(g)(alpha(h)(x))$]),
    ),
    记号: [$g dot x := alpha(g)(x)$],
  )
]

#注条目("", "")[
  在固定#群作用 $alpha$ 的语境下，本节后续 *约定*：
  - 用记号 $g dot x$ 表示 $alpha(g)(x)$；
  - 凡出现 $X$ 时均默认带有该#群作用。
]

#定义条目("轨道", "Orbit", uuid: "Orbit")[
  #定义子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的#群作用], $x : X$),
    主体: [$x$ 在 $alpha$ 下的#轨道],
    内容: [#setOf($g dot x$, $g : G$)],
    记号: $Orb(x)$,
  )
]

#定义条目("稳定子群", "Stabilizer", uuid: "Stabilizer")[
  #结构实例子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的#群作用], $x : X$),
    主体: [$x$ 的#稳定子群],
    类别: [$G$ 的#子群],
    记号: $Stab(x)$,
    成员: (
      (name: [底集], value: [#setOf($g$, type: $G$, $g dot x = x$)]),
      (name: [群结构], value: [继承自 $G$]),
    ),
  )
]

#性质条目("轨道是集合的等价类", "", uuid: "OrbitsAsEquivalenceClasses")[
  #定理子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的#群作用]),
    结论: [关系 $x tilde y$ 定义为 $exists g : G, g dot x = y$ 是 $X$ 上的等价关系；其等价类恰为各个#轨道],
  )
]

#定理条目("轨道-稳定子定理", "Orbit-Stabilizer Theorem", uuid: "OrbitStabilizerTheorem")[
  #定理子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的#群作用], [$G$ 是有限#群], $x : X$),
    结论: [$|Orb(x)| dot |Stab(x)| = |G|$],
  )
]

#定义条目("不动点集", "Fixed Point Set", uuid: "FixedPointSet")[
  #定义子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的#群作用], $g : G$),
    主体: [$g$ 在 $X$ 上的#不动点集],
    内容: [#setOf($x$, type: $X$, $g dot x = x$)],
    记号: $X^g$,
  )
]

#引理条目("Burnside 计数引理", "Burnside's Lemma", uuid: "BurnsideLemma")[
  #定理子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的#群作用], [$G$ 是有限#群], [$X$ 是有限类型]),
    结论: [
      $ |X slash G| = (1 / |G|) sum_(g in G) |X^g| $
      其中 $X slash G$ 表#轨道;之集
    ],
    cstyle: "display",
  )
]

#定义条目("共轭作用", "Conjugation Action", uuid: "ConjugationAction")[
  #结构实例子句(
    条件: ([~$(G, dot)$ 是#群]),
    主体: [$G$ 在自身上的#共轭作用],
    类别: [$G$ 在 $G$ 上的#群作用],
    成员: (
      (name: [作用映射], value: [$g dot x := g x g^(-1)$]),
    ),
  )
]

#定义条目("共轭类", "Conjugacy Class", uuid: "ConjugacyClass")[
  #定义子句(
    条件: ([~$(G, dot)$ 是#群], $x : G$),
    主体: [$x$ 的#共轭类],
    内容: [$x$ 在 $G$ 的#共轭作用;下的#轨道，即#setOf($g x g^(-1)$, $g : G$)],
  )
]

#定义条目("中心化子", "Centralizer", uuid: "Centralizer")[
  #定义子句(
    条件: ([~$(G, dot)$ 是#群], $x : G$),
    主体: [$x$ 在 $G$ 中的#中心化子],
    内容: [$x$ 在 $G$ 的#共轭作用;下的#稳定子群，即#setOf($g$, type: $G$, $g x = x g$)],
    记号: $Centralizer(x)$,
  )
]

#定义条目("中心", "Center", uuid: "Center")[
  #结构实例子句(
    条件: ([~$(G, dot)$ 是#群]),
    主体: [$G$ 的#中心],
    类别: [$G$ 的#子群],
    记号: $Center(G)$,
    成员: (
      (name: [底集], value: [#setOf($g$, type: $G$, $forall x : G, g x = x g$)]),
      (name: [群结构], value: [继承自 $G$]),
    ),
  )
]

#注条目("", "")[
  $G$ 的#中心;是各个元素的#中心化子;之交：$Center(G) = inter.big_(x : G) Centralizer(x)$；并且 $Center(G)$ 是 $G$ 的#Abel群#子群。
]

#定理条目("类方程", "Class Equation", uuid: "ClassEquation")[
  #定理子句(
    条件: ([~$(G, dot)$ 是有限#群], [$x_1, ..., x_k$ 是 $G$ 中各非中心#共轭类;的代表元]),
    结论: [
      $ |G| = |Center(G)| + sum_(i = 1)^k [G : Centralizer(x_i)] $
    ],
    cstyle: "display",
  )
]


#context if 看不看范畴论.get() [

== 群范畴

#定义条目("群范畴", "Category of Groups", uuid: "CategoryOfGroups")[
  #结构实例子句(
    主体: [#群范畴],
    类别: [范畴],
    记号: $bold("Grp")$,
    成员: (
      (name: [对象], value: [一切#群]),
      (name: [态射], value: [#群同态]),
      (name: [复合], value: [函数复合]),
      (name: [恒等态射], value: [恒等映射]),
    ),
  )
]

#性质条目("群范畴中的同构", "", uuid: "GroupCategoryIsomorphism")[
  #定理子句(
    条件: ([~$G, H$ 是#群], $f : GHom(G, H)$),
    结论: [$f$ 在#群范畴 $bold("Grp")$ 中为同构#iff $f$ 是#群同态;中的#群同构（即 $G GIso H$）],
  )
]

#定义条目("群直积", "Direct Product of Groups", uuid: "DirectProductOfGroups")[
  #结构实例子句(
    条件: ([~$(G, dot_G), (H, dot_H)$ 是#群]),
    主体: [$G$ 与 $H$ 的#群直积],
    类别: [#群],
    记号: $G times H$,
    成员: (
      (name: [底集], value: [积类型 $G times H$]),
      (name: [乘法], value: [$(g_1, h_1) dot (g_2, h_2) := (g_1 dot_G g_2, thin h_1 dot_H h_2)$]),
      (name: [#单位元], value: [$(e_G, e_H)$]),
      (name: [#逆元], value: [$(g, h)^(-1) := (g^(-1), h^(-1))$]),
    ),
  )
]

#注条目("", "")[#群直积;是#群范畴 $bold("Grp")$ 中的积；分量投影 $pi_G : G times H -> G$ 与 $pi_H : G times H -> H$ 给出对应的泛性质。]

#定义条目("群余积", "Coproduct of Groups", uuid: "CoproductOfGroups")[
  #定义子句(
    条件: ([~$(G, dot_G), (H, dot_H)$ 是#群]),
    主体: [$G$ 与 $H$ 的#群余积],
    内容: [$G$ 与 $H$ 在#群范畴 $bold("Grp")$ 中的余积，即两群的#自由积],
    记号: $G * H$,
  )
]

#性质条目("群范畴是完备与余完备的", "", uuid: "GroupCategoryBicomplete")[
  #定理子句(
    结论: [#群范畴 $bold("Grp")$ 拥有全部小极限与小余极限],
  )
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
  #结构子句(
    主体: [$(R, +, dot)$ 是#环],
    isPredicate: true,
    成员: (
      (name: [加法交换群], value: [$(R, +)$ 是#Abel群]),
      (name: [乘法半群], value: [$(R, dot)$ 是#半群]),
      (name: [分配律], value: [$forall (a, b, c : R), a dot (b + c) = a dot b + a dot c and (a + b) dot c = a dot c + b dot c$]),
    ),
  )
]

#注条目("", "")[
  - 本笔记中“#环”默认 *不* 要求含幺；含幺的#环;另设为“#幺环”。例如 $2 bb(Z)$ 是#环，但不是#幺环。
  - 通常省去乘号 $dot$，把 $a dot b$ 简写为 $a b$。
]

#定义条目("交换环", "Commutative Ring", uuid: "CommutativeRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#交换环],
    extends: ([$(R, +, dot)$ 是#环],),
    isPredicate: true,
    成员: (
      (name: [乘法交换律], value: [$forall (a, b : R), a dot b = b dot a$]),
    ),
  )
]

#定义条目("幺环", "Unital Ring", uuid: "UnitalRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#幺环],
    extends: ([$(R, +, dot)$ 是#环],),
    isPredicate: true,
    成员: (
      (name: [乘法#单位元], name_en: [Multiplicative Identity], varName: $1$, value: $R$),
      (name: [#单位元;律], value: [$forall (a : R), 1 dot a = a = a dot 1$]),
    ),
  )
]

#定义条目("交换幺环", "Commutative Unital Ring", uuid: "CommutativeUnitalRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#交换幺环],
    isPredicate: true,
    extends: ([$(R, +, dot)$ 是#交换环], [$(R, +, dot)$ 是#幺环]),
    成员: (),
  )
]


#性质条目("环中乘法零元吸收律", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], $a : R$),
    结论: [$0 dot a = a dot 0 = 0$],
  )
]

#性质条目("环中加法逆元与乘法相容", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], $a, b : R$),
    结论: [$(-a) dot b = a dot (-b) = -(a dot b)$],
  )
]

#性质条目("环的有限乘法分配律", "Generalized Distributivity", uuid: "GeneralizedDistributivity")[
  #定理子句(
    条件: (
      [~$(R, +, dot)$ 是#环],
      $m\, n : bb(N)_+$,
      $a_1, dots, a_m : R$,
      $b_1, dots, b_n : R$,
    ),
    结论: [$(sum_(i=1)^m a_i) dot (sum_(j=1)^n b_j) = sum_(i=1)^m sum_(j=1)^n a_i dot b_j$],
  )
]


#定义条目("环上的整数数乘", "Integer Scalar Multiplication on Ring", uuid: "RingIntegerScalar")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#环], $n : bb(Z)$, $a : R$),
    主体: [$n$ 在 $a$ 上的#整数数乘],
    bstyle: "display",
    内容: [
      - 当 $n = 0$：$0 dot.c a := 0_R$。
      - 当 $n > 0$：$n dot.c a := underbrace(a + a + dots.c + a, n " 项")$。
      - 当 $n < 0$：$n dot.c a := -((-n) dot.c a)$。
    ],
    记号: $n dot.c a$,
  )
]

#注条目("", "")[
  此“数乘”记号 $dot.c$ 与环内乘法 $dot$ 区分；$n dot.c a$ 中 $n$ 取自 $bb(Z)$ 而非 $R$。即便 $R$ 不含整数环作为子环（如 $bb(Z) slash 5 bb(Z)$），$n dot.c a$ 仍有定义。
]

#性质条目("整数数乘与环乘法交换", "Integer Scalar Commutes with Multiplication", uuid: "IntegerScalarCommutesMul")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], $n : bb(Z)$, $a, b : R$),
    结论: [$n dot.c (a dot b) = (n dot.c a) dot b = a dot (n dot.c b)$],
  )
]

#性质条目("整数数乘的双线性", "Bilinearity of Integer Scalar Multiplication", uuid: "IntegerScalarBilinear")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], $m\, n : bb(Z)$, $a, b : R$),
    cstyle: "display",
    结论: [
      - $(m + n) dot.c a = m dot.c a + n dot.c a$；
      - $n dot.c (a + b) = n dot.c a + n dot.c b$；
      - $(m dot.c n) dot.c a = m dot.c (n dot.c a)$。
    ],
  )
]


#定义条目("幂零元", "Nilpotent", uuid: "Nilpotent")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#幺环], $a : R$),
    主体: [$a$ 是#幂零元],
    isPredicate: true,
    内容: [$exists n : bb(N), a^n = 0$],
  )
]

#定义条目("幂等元", "Idempotent", uuid: "Idempotent")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#环], $a : R$),
    主体: [$a$ 是#幂等元],
    isPredicate: true,
    内容: [$a^2 = a$],
  )
]


== 环同态

#约定[
  - $(R, +_R, dot_R), (S, +_S, dot_S)$ 是#环
  - $f : R -> S$
]

#定义条目("环同态", "Ring Homomorphism", uuid: "RingHomomorphism")[
  #结构子句(
    主体: [$f$ 是 $R$ 到 $S$ 的#环同态],
    isPredicate: true,
    成员: (
      (name: [保加法], value: [$forall (a, b : R), f(a +_R b) = f(a) +_S f(b)$]),
      (name: [保乘法], value: [$forall (a, b : R), f(a dot_R b) = f(a) dot_S f(b)$]),
    ),
    记号: RHom($R$, $S$),
  )
]

#定义条目("幺环同态", "Unital Ring Homomorphism", uuid: "UnitalRingHomomorphism")[
  #结构子句(
    条件: ([~$(R, +_R, dot_R, 1_R), (S, +_S, dot_S, 1_S)$ 是#幺环], $f : R -> S$),
    主体: [$f$ 是 $R$ 到 $S$ 的#幺环同态],
    isPredicate: true,
    extends: ([$f$ 是 $R$ 到 $S$ 的#环同态],),
    成员: (
      (name: [保单位元], value: [$f(1_R) = 1_S$]),
    ),
    记号: URHom($R$, $S$),
  )
]

#定义条目("环同态的核", "Kernel", uuid: "RingHomKernel")[
  #定义子句(
    条件: ([~$f$ 是#环同态]),
    主体: [$f$ 的#环同态的核],
    内容: [#setOf($a$, type: $R$, $f(a) = 0_S$)，为 $R$ 的#理想],
    记号: $RKer(f)$,
  )
]

#定义条目("环同态的像", "Image", uuid: "RingHomImage", isExtension: true)[
  #定义子句(
    条件: ([~$f$ 是#环同态]),
    主体: [$f$ 的#环同态的像],
    内容: [#setOf($f(a)$, $a : R$)，为 $S$ 的#子环],
    记号: $RIm(f)$,
  )
]

#定义条目("环同构", "Ring Isomorphism", uuid: "RingIsomorphism")[
  #结构子句(
    主体: [$f$ 是 $R$ 到 $S$ 的#环同构],
    isPredicate: true,
    extends: ([$f$ 是 $R$ 到 $S$ 的#环同态],),
    成员: (
      (name: [逆同态], name_en: [Inverse Homomorphism], varName: $g$, value: $RHom(S, R)$),
      (name: [互逆性], name_en: [Two-sided Inverse], value: [$f compose g = id_S and g compose f = id_R$]),
    ),
    记号: [$R RIso S$],
  )
]

#定义条目("环单同态", "Ring Monomorphism", uuid: "RingMonomorphism")[
  #结构子句(
    主体: [$f$ 是 $R$ 到 $S$ 的#环单同态],
    isPredicate: true,
    extends: ([$f$ 是 $R$ 到 $S$ 的#环同态],),
    成员: (
      (name: [单射性], name_en: [Injectivity], value: [$f$ 是单射]),
    ),
    记号: [$R RMono S$],
  )
]

#定义条目("环满同态", "Ring Epimorphism", uuid: "RingEpimorphism")[
  #结构子句(
    主体: [$f$ 是 $R$ 到 $S$ 的#环满同态],
    isPredicate: true,
    extends: ([$f$ 是 $R$ 到 $S$ 的#环同态],),
    成员: (
      (name: [满射性], name_en: [Surjectivity], value: [$f$ 是满射]),
    ),
    记号: [$R REpi S$],
  )
]

#定义条目("环自同态", "Ring Endomorphism", uuid: "RingEndomorphism")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#环]),
    主体: [$R$ 上的#环自同态],
    内容: [$R$ 到自身的#环同态],
    记号: $REnd(R)$,
  )
]

#定义条目("环自同构", "Ring Automorphism", uuid: "RingAutomorphism")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#环]),
    主体: [$R$ 上的#环自同构],
    内容: [$R$ 到自身的#环同构;全体在复合下构成的群],
    记号: $RAut(R)$,
  )
]

#定理条目("环第一同构定理", "First Isomorphism Theorem")[
  #定理子句(
    条件: ([~$f : R -> S$ 是#环同态]),
    结论: [$R slash RKer(f) tilde.equiv RIm(f)$ 作为#环],
  )
]

#定理条目("环第二同构定理", "Second Isomorphism Theorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], [$S$ 是 $R$ 的#子环], [$I$ 是 $R$ 的#理想]),
    结论: [$(S + I) slash I tilde.equiv S slash (S inter I)$],
  )
]

#定理条目("环第三同构定理", "Third Isomorphism Theorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], [$I, J$ 是 $R$ 的#理想], $I subset.eq J$),
    结论: [$(R slash I) slash (J slash I) tilde.equiv R slash J$],
  )
]

#定理条目("理想对应定理", "Correspondence Theorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#环], [$I$ 是 $R$ 的#理想]),
    结论: [商映射 $pi : R -> R slash I$ 在含 $I$ 的 $R$ 的#理想;与 $R slash I$ 的#理想;之间建立保包含的双射],
  )
]


== 子环与理想

#约定[
  - $(R, +, dot)$ 是#环
  - $S, I, J : Set(R)$
]

#定义条目("子环", "Subring", uuid: "Subring")[
  #定义子句(
    主体: [$S$ 是 $R$ 的#子环],
    isPredicate: true,
    内容: [$(S, +|_S, dot|_S)$ 是#环],
  )
]

#性质条目("幺环子环含单位元", "Subring of Unital Ring Contains Unit", uuid: "SubringOfUnitalRing")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#幺环], [$S$ 是 $R$ 的#子环]),
    结论: [$S$ 也是#幺环;当且仅当 $1_R in S$],
  )
]

#定义条目("左理想", "Left Ideal", uuid: "LeftIdeal")[
  #定义子句(
    主体: [$I$ 是 $R$ 的#左理想],
    isPredicate: true,
    内容: [$I$ 是 $R$ 的#子环，且 $forall (r : R) (x : I), r dot x in I$],
  )
]

#定义条目("右理想", "Right Ideal", uuid: "RightIdeal", isExtension: true)[
  #定义子句(
    主体: [$I$ 是 $R$ 的#右理想],
    isPredicate: true,
    内容: [$I$ 是 $R$ 的#子环，且 $forall (x : I) (r : R), x dot r in I$],
  )
]

#定义条目("理想", "Ideal", uuid: "TwoSidedIdeal", isExtension: true)[
  #定义子句(
    主体: [$I$ 是 $R$ 的#理想],
    isPredicate: true,
    内容: [$I$ 同时是 $R$ 的#左理想;与#右理想],
  )
]

#注条目("", "")[
  本笔记中“#理想”是双边理想的简称；在#交换环;中左、右、双边#理想;三者重合。
]

#定义条目("真理想", "Proper Ideal", uuid: "ProperIdeal")[
  #定义子句(
    条件: ([$I$ 是 $R$ 的#理想]),
    主体: [$I$ 是 $R$ 的#真理想],
    isPredicate: true,
    内容: [$I != R$],
  )
]

#定义条目("由集合生成的理想", "Ideal Generated by a Set", uuid: "IdealGenerated")[
  #定义子句(
    主体: [由 $S$ 生成的#理想],
    内容: [包含 $S$ 的一切#理想;之交],
    记号: $IdealGen(S)$,
  )
]

#定义条目("主理想", "Principal Ideal", uuid: "PrincipalIdeal")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#交换幺环], [$I$ 是 $R$ 的#理想]),
    主体: [$I$ 是#主理想],
    isPredicate: true,
    内容: [$exists a : R, I = (a) :=$ #setOf($r dot a$, $r : R$)],
  )
]

#定义条目("素理想", "Prime Ideal", uuid: "PrimeIdeal")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#交换幺环], [$P$ 是 $R$ 的#理想]),
    主体: [$P$ 是#素理想],
    isPredicate: true,
    内容: [$P$ 是#真理想，且 $forall (a, b : R), a dot b in P ==> a in P or b in P$],
  )
]

#定义条目("极大理想", "Maximal Ideal", uuid: "MaximalIdeal")[
  #结构子句(
    主体: [$M$ 是#幺环 $R$ 的#极大理想],
    extends: ([$M$ 是 $R$ 的#真理想],),
    isPredicate: true,
    成员: (
      (name: [无更大真理想], value: [$forall J, (J$ 是 $R$ 的#理想$) and M subset.eq J subset.neq R ==> J = M$]),
    ),
  )
]

#性质条目("极大理想是素理想", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#交换幺环], [$M$ 是 $R$ 的#极大理想]),
    结论: [$M$ 是#素理想],
  )
]

#定义条目("单环", "Simple Ring", uuid: "SimpleRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#单环],
    extends: ([$(R, +, dot)$ 是#环], [$R != 0$]),
    isPredicate: true,
    成员: (
      (name: [无非平凡双边理想], name_en: [No Nontrivial Two-sided Ideal], value: [$forall I, (I$ 是 $R$ 的#理想$) ==> I = 0 or I = R$]),
    ),
  )
]


== 理想运算

#约定[
  - $(R, +, dot)$ 是#环
  - $I, J$ 是 $R$ 的#理想
]

#定义条目("理想的和", "Sum of Ideals", uuid: "IdealSum")[
  #定义子句(
    主体: [#理想的和 $I + J$],
    内容: [#setOf($a + b$, $a in I, b in J$)，仍为 $R$ 的#理想],
  )
]

#定义条目("理想的积", "Product of Ideals", uuid: "IdealProduct")[
  #定义子句(
    主体: [#理想的积 $I dot J$],
    内容: [由集合#setOf($a dot b$, $a in I, b in J$) 生成的#理想],
  )
]

#定义条目("理想的交", "Intersection of Ideals", uuid: "IdealIntersection")[
  #定义子句(
    主体: [#理想的交 $I inter J$],
    内容: [集合交#setOf($x$, $x in I and x in J$)，仍为 $R$ 的#理想],
  )
]

#性质条目("理想运算的包含关系", "")[
  #定理子句(
    结论: [$I dot J subset.eq I inter J subset.eq I + J$],
  )
]


== 商环

#约定[
  - $(R, +, dot)$ 是#环
  - $I$ 是 $R$ 的#理想
]

#定义条目("商环", "Quotient Ring", uuid: "QuotientRing")[
  #定义子句(
    主体: [#环 $R$ 对#理想 $I$ 的#商环],
    bstyle: "display",
    内容: [
      - 底集：#setOf($a + I$, $a : R$)，其中 $a + I :=$ #setOf($a + x$, $x : I$)。
      - 加法：$(a + I) + (b + I) := (a + b) + I$。
      - 乘法：$(a + I) dot (b + I) := (a dot b) + I$。
      - $I$ 是#理想;保证乘法定义不依赖于陪集代表元的选取。
    ],
    记号: $R slash I$,
  )
]

#性质条目("幺环的商环仍为幺环", "Quotient of Unital Ring is Unital", uuid: "QuotientOfUnitalRing")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#幺环], [$I$ 是 $R$ 的#理想]),
    结论: [#商环 $R slash I$ 仍为#幺环，其单位元为 $1_R + I$],
  )
]

#性质条目("商环是域当且仅当理想极大", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#交换幺环], [$M$ 是 $R$ 的#理想]),
    结论: [$R slash M$ 是#域#iff;$M$ 是#极大理想],
  )
]

#性质条目("商环是整环当且仅当理想素", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#交换幺环], [$P$ 是 $R$ 的#理想]),
    结论: [$R slash P$ 是#整环#iff;$P$ 是#素理想],
  )
]


== 直和与中国剩余定理

#约定[
  - $(R, +, dot)$ 是#环
]

#定义条目("环的直积", "Direct Product of Rings", uuid: "RingDirectProduct")[
  #定义子句(
    条件: ([~$(R_1, +_1, dot_1), dots, (R_n, +_n, dot_n)$ 是#环]),
    主体: [$R_1, dots, R_n$ 的#环的直积],
    bstyle: "display",
    内容: [
      - 底集：笛卡儿积 $R_1 times dots.c times R_n$。
      - 加法：$(a_1, dots, a_n) + (b_1, dots, b_n) := (a_1 +_1 b_1, dots, a_n +_n b_n)$。
      - 乘法：$(a_1, dots, a_n) dot (b_1, dots, b_n) := (a_1 dot_1 b_1, dots, a_n dot_n b_n)$。
    ],
    记号: $product_(i=1)^n R_i$,
  )
]

#注条目("", "", uuid: "RingDirectProductRemark")[
  - 若每个 $R_i$ 是#幺环，则 $product_i R_i$ 是#幺环，单位元为 $(1_1, dots, 1_n)$。
  - 在#交换环 / #幺环 / #交换幺环;等子范畴内有限直积均封闭。
  - 有限直积同构于环的外直和（记号 $plus.o$）；无限情形二者分歧（积取所有分量，和取仅有限多分量非零）。
]

#定义条目("理想互素", "Coprime Ideals", uuid: "CoprimeIdeals")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#幺环], [$I, J$ 是 $R$ 的#理想]),
    主体: [$I$ 与 $J$ #理想互素],
    isPredicate: true,
    内容: [$I + J = R$],
  )
]

#定理条目("中国剩余定理", "Chinese Remainder Theorem", uuid: "ChineseRemainderTheorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#交换幺环], [$I_1, dots, I_n$ 是 $R$ 的#理想], [$forall i != j, I_i$ 与 $I_j$ #理想互素]),
    结论: [自然映射 $R slash (I_1 inter dots inter I_n) -> product_(k=1)^n R slash I_k$，$a + (I_1 inter dots inter I_n) |-> (a + I_1, dots, a + I_n)$ 是#环同构],
  )
]

#注条目("", "", uuid: "CRTConsequenceRemark")[
  CRT 的经典例子是 $bb(Z) slash m n bb(Z) tilde.equiv bb(Z) slash m bb(Z) times bb(Z) slash n bb(Z)$，当 $gcd(m, n) = 1$。一般地，对正整数 $m = p_1^(e_1) dots p_k^(e_k)$ 的素因子分解，$bb(Z) slash m bb(Z) tilde.equiv product_i bb(Z) slash p_i^(e_i) bb(Z)$。
]


== 多项式环

#约定[
  - $(R, +, dot)$ 是#交换幺环
]

#定义条目("多项式环", "Polynomial Ring", uuid: "PolynomialRing")[
  #定义子句(
    主体: [$R$ 上以 $x$ 为不定元的#多项式环 $R[x]$],
    bstyle: "display",
    内容: [
      - 底集：$R[x] :=$ #setOf($(a_0, a_1, dots, a_n)$, $n : bb(N), a_i : R$)，记为 $a_0 + a_1 x + dots.c + a_n x^n$。
      - 加法：逐项相加。
      - 乘法：$(sum_i a_i x^i) dot (sum_j b_j x^j) := sum_k (sum_(i + j = k) a_i dot b_j) x^k$。
    ],
  )
]

#定义条目("多项式的次数", "Degree of a Polynomial", uuid: "PolynomialDegree")[
  #定义子句(
    条件: ([~$R$ 是#交换幺环], $f : R[x]$),
    主体: [$f$ 的#多项式的次数 $deg(f)$],
    内容: [最高非零项的指数；当 $f = 0$ 时规定 $deg(0) = -infinity$],
  )
]

#定义条目("首一多项式", "Monic Polynomial", uuid: "MonicPolynomial")[
  #定义子句(
    条件: ([~$R$ 是#交换幺环], $f : R[x]$, $f != 0$),
    主体: [$f$ 是#首一多项式],
    isPredicate: true,
    内容: [$f$ 的 $deg(f)$ 次项系数为 $1_R$],
  )
]

#性质条目("整环上多项式次数加法律", "")[
  #定理子句(
    条件: ([~$R$ 是#整环], $f, g : R[x]$, $f, g != 0$),
    结论: [$deg(f dot g) = deg(f) + deg(g)$ 且 $R[x]$ 仍为#整环],
  )
]


== 整环

#约定[
  - $(R, +, dot)$ 是#环
  - $a, b : R$
]

#定义条目("零因子", "Zero Divisor", uuid: "ZeroDivisor")[
  #定义子句(
    条件: ($a != 0$),
    主体: [$a$ 是#零因子],
    isPredicate: true,
    内容: [$exists b : R, b != 0 and (a dot b = 0 or b dot a = 0)$],
  )
]

#定义条目("左零因子", "Left Zero Divisor", uuid: "LeftZeroDivisor", isExtension: true)[
  #定义子句(
    条件: ($a != 0$),
    主体: [$a$ 是#左零因子],
    isPredicate: true,
    内容: [$exists b : R, b != 0 and a dot b = 0$],
  )
]

#定义条目("右零因子", "Right Zero Divisor", uuid: "RightZeroDivisor", isExtension: true)[
  #定义子句(
    条件: ($a != 0$),
    主体: [$a$ 是#右零因子],
    isPredicate: true,
    内容: [$exists b : R, b != 0 and b dot a = 0$],
  )
]

#注条目("", "")[
  - $a$ 是#零因子#iff;$a$ 是#左零因子;或 $a$ 是#右零因子。
  - 在#交换环;中，左、右#零因子;三者重合。
]


#定义条目("整环", "Integral Domain", uuid: "IntegralDomain")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#整环],
    extends: ([$(R, +, dot)$ 是#交换幺环],),
    isPredicate: true,
    成员: (
      (name: [非平凡], name_en: [Nontriviality], value: [$1 != 0$]),
      (name: [无零因子], name_en: [No Zero Divisors], value: [$forall (a, b : R), a dot b = 0 ==> a = 0 or b = 0$]),
    ),
  )
]


#约定[
  - $(R, +, dot)$ 是#交换幺环
]

#定义条目("整除", "Divides", uuid: "Divides")[
  #定义子句(
    主体: [$a$ #整除 $b$，记作 $a divides b$],
    isPredicate: true,
    内容: [$exists c : R, b = a dot c$],
  )
]

#定义条目("素", "Prime", uuid: "PrimeElement")[
  #定义子句(
    主体: [$p$ #素],
    isPredicate: true,
    内容: [$p != 0$，$p in.not UnitGroupOf(R)$，且 $forall (a, b : R), p divides (a dot b) ==> p divides a or p divides b$],
  )
]

#定义条目("不可约", "Irreducible", uuid: "IrreducibleElement")[
  #定义子句(
    主体: [$p$ #不可约],
    isPredicate: true,
    内容: [$p != 0$，$p in.not UnitGroupOf(R)$，且 $forall (a, b : R), p = a dot b ==> a in UnitGroupOf(R) or b in UnitGroupOf(R)$],
  )
]

#定义条目("相伴", "Associate", uuid: "Associate")[
  #定义子句(
    主体: [$a$ 与 $b$ #相伴],
    isPredicate: true,
    内容: [$exists u : UnitGroupOf(R), b = u dot a$],
    记号: $a tilde b$,
  )
]

#性质条目("整环中素的元是不可约的", "")[
  #定理子句(
    条件: ([~$R$ 是#整环], [$p : R$], [$p$ #素]),
    结论: [$p$ #不可约],
  )
]


#定义条目("欧几里得整环", "Euclidean Domain", uuid: "EuclideanDomain")[
  #结构子句(
    主体: [$(R, +, dot, delta)$ 是#欧几里得整环],
    extends: ([$(R, +, dot)$ 是#整环],),
    isPredicate: true,
    成员: (
      (name: [欧几里得范数], name_en: [Euclidean Norm], varName: $delta$, value: $R without {0} -> bb(N)$),
      (name: [带余除法], name_en: [Division with Remainder], value: [$forall (a : R) (b : R without {0}), exists q, r : R, a = b dot q + r and (r = 0 or delta(r) < delta(b))$]),
    ),
  )
]

#定义条目("主理想整环", "Principal Ideal Domain", uuid: "PrincipalIdealDomain")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#主理想整环],
    extends: ([$(R, +, dot)$ 是#整环],),
    isPredicate: true,
    成员: (
      (name: [理想均为主理想], name_en: [Every Ideal is Principal], value: [$forall I, I$ 是 $R$ 的#理想 $==> I$ 是 $R$ 的#主理想]),
    ),
  )
]

#定义条目("唯一分解整环", "Unique Factorization Domain", uuid: "UniqueFactorizationDomain")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#唯一分解整环],
    extends: ([$(R, +, dot)$ 是#整环],),
    isPredicate: true,
    成员: (
      (name: [存在分解], name_en: [Existence of Factorization], value: [$forall a : R, a != 0 and a in.not UnitGroupOf(R) ==> exists n : bb(N), exists p_1, dots, p_n : R, (forall i, p_i$ #不可约$) and a = p_1 dot p_2 dots p_n$]),
      (name: [分解唯一], name_en: [Uniqueness of Factorization], value: [若 $a = p_1 dots p_n = q_1 dots q_m$ 是两个不可约元素的分解，则 $n = m$ 且存在 $S_n$ 中置换 $sigma$ 使 $forall i, p_i tilde q_(sigma(i))$（即两两#相伴）]),
    ),
  )
]

#注条目("", "")[
  分解唯一性中的#相伴;即“差一个#单位;因子”。换言之：在不计因子顺序与单位倍数的意义下，分解唯一。
]

#性质条目("欧几里得整环蕴含主理想整环蕴含唯一分解整环", "ED implies PID implies UFD")[
  #定理子句(
    结论: [任一#欧几里得整环;是#主理想整环；任一#主理想整环;是#唯一分解整环；反向均不成立],
  )
]

#性质条目("唯一分解整环中不可约元素等价于素元素", "Irreducible iff Prime in UFD")[
  #定理子句(
    条件: ([~$R$ 是#唯一分解整环], $p : R$),
    结论: [$p$ #不可约#iff;$p$ #素],
  )
]


#约定[
  - $d : bb(Z)$
  - $d$ 无平方因子 且 $d != 1$
]

#定义条目("二次整环", "Quadratic Integer Ring", uuid: "QuadraticIntegerRing")[
  #结构实例子句(
    主体: [$d$ 决定的#二次整环],
    类别: [#交换幺环],
    记号: $bb(Z)[sqrt(d)]$,
    成员: (
      (name: [底集], value: [#setOf($a + b sqrt(d)$, $a, b : bb(Z)$)，作为 $bb(C)$ 的子集]),
      (name: [加法], value: [继承自 $bb(C)$，逐分量相加]),
      (name: [乘法], value: [$(a_1 + b_1 sqrt(d))(a_2 + b_2 sqrt(d)) := (a_1 a_2 + d b_1 b_2) + (a_1 b_2 + a_2 b_1) sqrt(d)$]),
      (name: [乘法#单位元], value: [$1 = 1 + 0 sqrt(d)$]),
    ),
  )
]

#注条目("", "")[
  - 当 $d < 0$ 时取 $sqrt(d) = sqrt(|d|) i$（虚二次整环）；当 $d > 0$ 时取 $sqrt(d)$ 为正实数（实二次整环）。
  - 一般的 *代数整数环* 比 $bb(Z)[sqrt(d)]$ 更大，例如 $d equiv 1 (mod 4)$ 时它是 $bb(Z)[(1 + sqrt(d)) slash 2]$；本节只处理 $bb(Z)[sqrt(d)]$ 形式的子环作为入门。
]

#定义条目("Gauss 整环", "Gaussian Integers", uuid: "GaussianIntegers")[
  #定义子句(
    主体: [#Gauss整环],
    内容: [$d = -1$ 时的#二次整环 $bb(Z)[sqrt(-1)]$，写作 $bb(Z)[i]$],
  )
]

#定义条目("Eisenstein 整环", "Eisenstein Integers", uuid: "EisensteinIntegers", isExtension: true)[
  #定义子句(
    主体: [#Eisenstein整环],
    内容: [$bb(Z)[omega]$，其中 $omega = (-1 + sqrt(-3)) slash 2$ 是 $1$ 的本原 $3$ 次单位根],
  )
]

#定义条目("二次整环上的范数", "Norm on Quadratic Integer Ring", uuid: "RingNorm")[
  #定义子句(
    条件: ([~$alpha = a + b sqrt(d) : bb(Z)[sqrt(d)]$]),
    主体: [$alpha$ 的#范数],
    内容: [$a^2 - d b^2 : bb(Z)$],
    记号: $GaussN(alpha)$,
  )
]

#注条目("", "")[
  - 在#Gauss整环 $bb(Z)[i]$ 中，$N(a + b i) = a^2 + b^2$ 始终非负，等于 $|a + b i|^2$。
  - 在实二次整环（$d > 0$）中 $N$ 可正可负，常用其绝对值 $|N|$ 作#欧几里得整环;的范数函数。
]

#性质条目("范数乘性", "Multiplicativity of Norm", uuid: "MultiplicativeNorm")[
  #定理子句(
    条件: ([~$alpha, beta : bb(Z)[sqrt(d)]$]),
    结论: [$GaussN(alpha dot beta) = GaussN(alpha) dot GaussN(beta)$],
  )
]

#性质条目("范数刻画单位", "Units via Norm", uuid: "UnitsViaNorm")[
  #定理子句(
    条件: ([~$alpha : bb(Z)[sqrt(d)]$]),
    结论: [$alpha in UnitGroupOf(bb(Z)[sqrt(d)]) #iff;|GaussN(alpha)| = 1$],
  )
]

#性质条目("Gauss 整环的单位群", "Units of Gaussian Integers", uuid: "UnitsOfGaussianIntegers")[
  #定理子句(
    结论: [$UnitGroupOf(bb(Z)[i]) = { 1, -1, i, -i }$，作为#群;同构于 $bb(Z) slash 4 bb(Z)$],
  )
]

#定理条目("Gauss 整环是欧几里得整环", "Gaussian Integers are Euclidean", uuid: "GaussianIsEuclidean")[
  #定理子句(
    结论: [$bb(Z)[i]$ 配以#范数 $N(a + b i) = a^2 + b^2$ 作为#欧几里得整环;的范数函数 $delta$ 构成#欧几里得整环；从而 $bb(Z)[i]$ 也是#主理想整环;与#唯一分解整环],
  )
]

#注条目("", "")[
  并非所有 $bb(Z)[sqrt(d)]$ 都是#唯一分解整环。例如 $bb(Z)[sqrt(-5)]$ 中
  $6 = 2 dot 3 = (1 + sqrt(-5))(1 - sqrt(-5))$
  给出 $6$ 的两个本质不同的不可约元素的分解，故它不是#唯一分解整环（更不是#主理想整环;或#欧几里得整环）。
]


#定义条目("分式域", "Field of Fractions", uuid: "FieldOfFractions")[
  #定义子句(
    条件: ([~$R$ 是#整环]),
    主体: [$R$ 的#分式域],
    bstyle: "display",
    内容: [
      - 在 $R times (R without {0})$ 上定义等价关系 $(a, b) tilde (c, d) iff a dot d = b dot c$；
      - 底集：$(R times (R without {0})) slash tilde$，等价类 $[(a, b)]$ 记作 $a / b$；
      - 加法：$a/b + c/d := (a dot d + b dot c) / (b dot d)$；
      - 乘法：$a/b dot c/d := (a dot c) / (b dot d)$；
      - 配以加法#单位元 $0 / 1$、乘法#单位元 $1 / 1$ 构成#域；
      - 伴随嵌入 $iota : R arrow.hook "Frac"(R), iota(a) = a / 1$。
    ],
    记号: $"Frac"(R)$,
  )
]

#性质条目("分式域是包含 R 的最小域", "")[
  #定理子句(
    条件: ([~$R$ 是#整环], [$K$ 是#域], [$phi : R -> K$ 是嵌入型#环同态]),
    结论: [$exists !$ #环同态 $tilde(phi) : "Frac"(R) -> K$ 使 $tilde(phi) compose iota = phi$],
  )
]


== 除环与域

#定义条目("单位 / 可逆元", "Unit", uuid: "Unit")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#幺环], $u : R$),
    主体: [$u$ 是#单位],
    isPredicate: true,
    内容: [$exists v : R, u dot v = v dot u = 1$],
  )
]

#定义条目("单位群", "Group of Units", uuid: "UnitGroup")[
  #结构实例子句(
    条件: ([~$(R, +, dot)$ 是#幺环]),
    主体: [#单位群 $R^times$],
    类别: [#群],
    记号: $R^times$,
    成员: (
      (name: [底集], value: [#setOf($u$, type: $R$, [$u$ 是#单位])]),
      (name: [乘法], value: [继承 $R$ 中的乘法 $dot$]),
      (name: [#单位元], value: [$R$ 的乘法#单位元 $1$]),
      (name: [#逆元], value: [每个 $u : R^times$ 取其在 $R$ 中的乘法#逆元]),
    ),
  )
]


#定义条目("除环 / 体", "Division Ring", uuid: "DivisionRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#除环],
    extends: ([$(R, +, dot)$ 是#幺环],),
    isPredicate: true,
    成员: (
      (name: [非平凡], name_en: [Nontriviality], value: [$1 != 0$]),
      (name: [非零元均可逆], name_en: [Every Nonzero Element is a Unit], value: [$forall (a : R), a != 0 ==> exists b : R, a dot b = b dot a = 1$]),
    ),
  )
]

#性质条目("除环是单环", "Division Ring is Simple")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#除环]),
    结论: [$(R, +, dot)$ 是#单环],
  )
]

#定义条目("域", "Field", uuid: "Field")[
  #结构子句(
    主体: [$(R, +, dot)$ 是#域],
    extends: ([$(R, +, dot)$ 是#除环],),
    isPredicate: true,
    成员: (
      (name: [乘法交换律], name_en: [Commutativity of Multiplication], value: [$forall (a, b : R), a dot b = b dot a$]),
    ),
  )
]

#性质条目("域是单环", "Field is Simple")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#域]),
    结论: [$(R, +, dot)$ 是#单环],
  )
]


#定义条目("环的特征", "Characteristic", uuid: "RingCharacteristic")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是#幺环]),
    主体: [$R$ 的#环的特征],
    内容: [满足 $n dot 1 = 0$ 的最小正整数 $n$；若不存在此类 $n$，则规定#char($R$) $= 0$],
    记号: char($R$),
  )
]

#性质条目("整环的特征是 0 或素数", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是#整环]),
    结论: [#char($R$) $= 0$ 或#char($R$) 为#素数],
  )
]


#context if 看不看范畴论.get() [

== 环范畴

#定义条目("环范畴", "Category of Rings", uuid: "CategoryOfRings")[
  #结构子句(
    主体: [#环范畴 $bold("Ring")$],
    成员: (
      (name: [对象], value: [全体#幺环]),
      (name: [态射], value: [幺环之间的#环同态]),
      (name: [复合], value: [函数复合]),
      (name: [恒态], value: [恒映射 $"id"_R$]),
    ),
  )
]

#性质条目("环范畴中的同构", "")[
  #定理子句(
    条件: ([~$f : R -> S$ 是 $bold("Ring")$ 中的态射]),
    结论: [$f$ 是 $bold("Ring")$ 中的同构#iff;$f$ 是#环同构],
  )
]

#定义条目("环直积", "Direct Product of Rings", uuid: "RingDirectProduct")[
  #定义子句(
    条件: ([~$R, S$ 是#幺环]),
    主体: [$R$ 与 $S$ 的#环直积 $R times S$],
    内容: [逐分量加法与乘法赋予 $R times S$ 以#幺环;结构，是 $bold("Ring")$ 中 $R$ 与 $S$ 的积],
  )
]

#性质条目("环范畴有积无余积 (交换情形不同)", "")[
  #定理子句(
    结论: [$bold("Ring")$ 有全部小积；余积在#交换幺环;范畴 $bold("CRing")$ 中为张量积 $R times.circle_(bb(Z)) S$，在 $bold("Ring")$ 中则非平凡],
  )
]

]


== 环论例子

#例条目("零环", "Zero Ring", uuid: "ZeroRing")[
  #定义子句(
    主体: [零环],
    内容: [只含一个元素的#幺环 ${0}$，其中 $0 = 1$],
  )
]

#例条目("整数环", "Integer Ring", uuid: "IntegerRing")[
  #定义子句(
    主体: [整数环 $bb(Z)$],
    内容: [底集为 $bb(Z)$，配以通常的加法与乘法，构成#交换幺环（且为#主理想整环、#唯一分解整环、#欧几里得整环，但非#域）],
  )
]

#例条目("偶整数环", "Even Integer Ring", uuid: "EvenIntegerRing", isExtension: true)[
  #定义子句(
    主体: [偶整数 $2 bb(Z)$],
    内容: [#setOf($2 k$, $k : bb(Z)$)，配以继承自 $bb(Z)$ 的加法与乘法，构成#交换环;但不构成#幺环（无单位元 $1$）],
  )
]

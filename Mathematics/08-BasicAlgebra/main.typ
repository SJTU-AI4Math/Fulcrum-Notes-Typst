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
    主体: [$sigma$ 是 $X$ 上的 #置换],
    isPredicate: true,
    内容: [$sigma$ 是双射],
  )
]

#定义条目("对称群", "Symmetric Group", uuid: "SymmetricGroup")[
  #结构实例子句(
    条件: ([~$X : Type$]),
    主体: [$X$ 上的 #对称群],
    类别: [#群],
    记号: $Sym(X)$,
    成员: (
      (name: [底集], value: [$\{ sigma : X -> X \ |\ sigma$ 是 $X$ 上的 #置换 $\}$]),
      (name: [乘法], value: [函数复合 $compose$]),
      (name: [#单位元], value: [恒等映射 $op("id")_X$]),
      (name: [#逆元], value: [双射的逆映射]),
    ),
  )
]

#注条目("", "")[
  当 $X = \{ 1, 2, ..., n \}$ 时，记其 #对称群 为 $SymmGroup(n)$，称为 $n$ 元 #对称群。
]

#定义条目("轮换", "Cycle", uuid: "Cycle")[
  #定义子句(
    条件: ([~$X : Type$], $r : bb(N)$, $r >= 2$, [$a_1, a_2, ..., a_r : X$ 两两不同]),
    主体: [由 $a_1, a_2, ..., a_r$ 决定的 $r$ 阶 #轮换],
    内容: [将 $a_i$ 映为 $a_(i+1)$（$i < r$）、$a_r$ 映为 $a_1$、其余元素保持不动的 #置换],
    记号: $(a_1 thin a_2 thin ... thin a_r)$,
  )
]

#定义条目("不交轮换", "Disjoint Cycles", uuid: "DisjointCycles")[
  #定义子句(
    条件: ([~$X : Type$], [$sigma_1, sigma_2$ 是 $X$ 上的 #轮换]),
    主体: [$sigma_1, sigma_2$ 是 #不交轮换],
    isPredicate: true,
    内容: [$sigma_1, sigma_2$ 各自所对应的 $a_i$ 元素集合 #不交],
  )
]

#定理条目("轮换分解定理", "Cycle Decomposition Theorem", uuid: "CycleDecomposition")[
  #定理子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    结论: [$sigma$ 可唯一地（不计因子顺序）分解为有限多个两两 #不交 的 #轮换 之乘积],
  )
]

#定义条目("对换", "Transposition", uuid: "Transposition")[
  #定义子句(
    条件: ([~$X : Type$], $sigma : Sym(X)$),
    主体: [$sigma$ 是 #对换],
    isPredicate: true,
    内容: [$sigma$ 是 $2$ 阶 #轮换],
  )
]

#定义条目("奇置换", "Odd Permutation", uuid: "OddPermutation")[
  #定义子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    主体: [$sigma$ 是 #奇置换],
    isPredicate: true,
    内容: [$sigma$ 可表为奇数个 #对换 的乘积],
  )
]
#定义条目("偶置换", "Even Permutation", uuid: "EvenPermutation", isExtension: true)[
  #定义子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    主体: [$sigma$ 是 #偶置换],
    isPredicate: true,
    内容: [$sigma$ 可表为偶数个 #对换 的乘积],
  )
]

#性质条目("奇偶性不依赖于分解", "", uuid: "PermutationParityWellDefined")[
  #定理子句(
    条件: ([~$X : Type$], [$X$ 是有限类型], $sigma : Sym(X)$),
    结论: [$sigma$ 的任意两个 #对换 分解的因子个数同奇偶；从而 #奇置换 与 #偶置换 互斥且穷尽 $Sym(X)$ 中所有元素],
  )
]

#定义条目("交错群", "Alternating Group", uuid: "AlternatingGroup")[
  #结构实例子句(
    条件: ([~$n : bb(N)$]),
    主体: [$n$ 元 #交错群],
    类别: [#群],
    记号: $A_n$,
    成员: (
      (name: [底集], value: [$\{ sigma : SymmGroup(n) \ |\ sigma$ 是 #偶置换 $\}$]),
      (name: [群结构], value: [继承自 $SymmGroup(n)$]),
    ),
  )
]

#定理条目("Cayley 定理", "Cayley's Theorem", uuid: "CayleyTheorem")[
  #定理子句(
    条件: ([~$(G, dot)$ 是 #群]),
    结论: [存在 #群单同态 $G arrow.hook Sym(G)$；即任意 #群 同构于其底集上某 #对称群 的 #子群],
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
    主体: [$alpha$ 是 $G$ 在 $X$ 上的 #群作用],
    isPredicate: true,
    成员: (
      (name: [作用映射], varName: $alpha$, value: $G -> X -> X$),
      (name: [#单位元 作用平凡], value: [$forall x : X, alpha(e)(x) = x$]),
      (name: [结合律], value: [$forall (g, h : G) (x : X), alpha(g dot h)(x) = alpha(g)(alpha(h)(x))$]),
    ),
    记号: [$g dot x := alpha(g)(x)$],
  )
]

#注条目("", "")[
  在固定 #群作用 $alpha$ 的语境下，本节后续 *约定*：
  - 用记号 $g dot x$ 表示 $alpha(g)(x)$；
  - 凡出现 $X$ 时均默认带有该 #群作用。
]

#定义条目("轨道", "Orbit", uuid: "Orbit")[
  #定义子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的 #群作用], $x : X$),
    主体: [$x$ 在 $alpha$ 下的 #轨道],
    内容: [$\{ g dot x \ |\ g : G \}$],
    记号: $Orb(x)$,
  )
]

#定义条目("稳定子群", "Stabilizer", uuid: "Stabilizer")[
  #结构实例子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的 #群作用], $x : X$),
    主体: [$x$ 的 #稳定子群],
    类别: [$G$ 的 #子群],
    记号: $Stab(x)$,
    成员: (
      (name: [底集], value: [$\{ g : G \ |\ g dot x = x \}$]),
      (name: [群结构], value: [继承自 $G$]),
    ),
  )
]

#性质条目("轨道是集合的等价类", "", uuid: "OrbitsAsEquivalenceClasses")[
  #定理子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的 #群作用]),
    结论: [关系 $x tilde y$ 定义为 $exists g : G, g dot x = y$ 是 $X$ 上的等价关系；其等价类恰为各个 #轨道],
  )
]

#定理条目("轨道-稳定子定理", "Orbit-Stabilizer Theorem", uuid: "OrbitStabilizerTheorem")[
  #定理子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的 #群作用], [$G$ 是有限 #群], $x : X$),
    结论: [$|Orb(x)| dot |Stab(x)| = |G|$],
  )
]

#定义条目("不动点集", "Fixed Point Set", uuid: "FixedPointSet")[
  #定义子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的 #群作用], $g : G$),
    主体: [$g$ 在 $X$ 上的 #不动点集],
    内容: [$\{ x : X \ |\ g dot x = x \}$],
    记号: $X^g$,
  )
]

#引理条目("Burnside 计数引理", "Burnside's Lemma", uuid: "BurnsideLemma")[
  #定理子句(
    条件: ([~$alpha$ 是 $G$ 在 $X$ 上的 #群作用], [$G$ 是有限 #群], [$X$ 是有限类型]),
    结论: [
      $ |X \/ G| = (1 / |G|) sum_(g in G) |X^g| $
      其中 $X \/ G$ 表 #轨道 之集
    ],
    cstyle: "display",
  )
]

#定义条目("共轭作用", "Conjugation Action", uuid: "ConjugationAction")[
  #结构实例子句(
    条件: ([~$(G, dot)$ 是 #群]),
    主体: [$G$ 在自身上的 #共轭作用],
    类别: [$G$ 在 $G$ 上的 #群作用],
    成员: (
      (name: [作用映射], value: [$g dot x := g x g^(-1)$]),
    ),
  )
]

#定义条目("共轭类", "Conjugacy Class", uuid: "ConjugacyClass")[
  #定义子句(
    条件: ([~$(G, dot)$ 是 #群], $x : G$),
    主体: [$x$ 的 #共轭类],
    内容: [$x$ 在 $G$ 的 #共轭作用 下的 #轨道，即 $\{ g x g^(-1) \ |\ g : G \}$],
  )
]

#定义条目("中心化子", "Centralizer", uuid: "Centralizer")[
  #定义子句(
    条件: ([~$(G, dot)$ 是 #群], $x : G$),
    主体: [$x$ 在 $G$ 中的 #中心化子],
    内容: [$x$ 在 $G$ 的 #共轭作用 下的 #稳定子群，即 $\{ g : G \ |\ g x = x g \}$],
    记号: $Centralizer(x)$,
  )
]

#定义条目("中心", "Center", uuid: "Center")[
  #结构实例子句(
    条件: ([~$(G, dot)$ 是 #群]),
    主体: [$G$ 的 #中心],
    类别: [$G$ 的 #子群],
    记号: $Center(G)$,
    成员: (
      (name: [底集], value: [$\{ g : G \ |\ forall x : G, g x = x g \}$]),
      (name: [群结构], value: [继承自 $G$]),
    ),
  )
]

#注条目("", "")[
  $G$ 的 #中心 是各个元素的 #中心化子 之交：$Center(G) = inter.big_(x : G) Centralizer(x)$；并且 $Center(G)$ 是 $G$ 的 #Abel群 #子群。
]

#定理条目("类方程", "Class Equation", uuid: "ClassEquation")[
  #定理子句(
    条件: ([~$(G, dot)$ 是有限 #群], [$x_1, ..., x_k$ 是 $G$ 中各非中心 #共轭类 的代表元]),
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
      (name: [对象], value: [一切 #群]),
      (name: [态射], value: [#群同态]),
      (name: [复合], value: [函数复合]),
      (name: [恒等态射], value: [恒等映射]),
    ),
  )
]

#性质条目("群范畴中的同构", "", uuid: "GroupCategoryIsomorphism")[
  #定理子句(
    条件: ([~$G, H$ 是 #群], $f : GHom(G, H)$),
    结论: [$f$ 在 #群范畴 $bold("Grp")$ 中为同构 #iff $f$ 是 #群同态 中的 #群同构（即 $G GIso H$）],
  )
]

#定义条目("群直积", "Direct Product of Groups", uuid: "DirectProductOfGroups")[
  #结构实例子句(
    条件: ([~$(G, dot_G), (H, dot_H)$ 是 #群]),
    主体: [$G$ 与 $H$ 的 #群直积],
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

#注条目("", "")[#群直积 是 #群范畴 $bold("Grp")$ 中的积；分量投影 $pi_G : G times H -> G$ 与 $pi_H : G times H -> H$ 给出对应的泛性质。]

#定义条目("群余积", "Coproduct of Groups", uuid: "CoproductOfGroups")[
  #定义子句(
    条件: ([~$(G, dot_G), (H, dot_H)$ 是 #群]),
    主体: [$G$ 与 $H$ 的 #群余积],
    内容: [$G$ 与 $H$ 在 #群范畴 $bold("Grp")$ 中的余积，即两群的 #自由积],
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
    主体: [$(R, +, dot)$ 是 #环],
    isPredicate: true,
    成员: (
      (name: [加法交换群], value: [$(R, +)$ 是 #Abel群]),
      (name: [乘法半群], value: [$(R, dot)$ 是 #半群]),
      (name: [分配律], value: [$forall (a, b, c : R), a dot (b + c) = a dot b + a dot c and (a + b) dot c = a dot c + b dot c$]),
    ),
  )
]

#注条目("", "")[
  - 本笔记中“#环”默认 *不* 要求含幺；含幺的 #环 另设为“#幺环”。例如 $2 ZZ$ 是 #环，但不是 #幺环。
  - 通常省去乘号 $dot$，把 $a dot b$ 简写为 $a b$。
]

#定义条目("交换环", "Commutative Ring", uuid: "CommutativeRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #交换环],
    extends: ([$(R, +, dot)$ 是 #环],),
    isPredicate: true,
    成员: (
      (name: [乘法交换律], value: [$forall (a, b : R), a dot b = b dot a$]),
    ),
  )
]

#定义条目("幺环", "Unital Ring", uuid: "UnitalRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #幺环],
    extends: ([$(R, +, dot)$ 是 #环],),
    isPredicate: true,
    成员: (
      (name: [乘法 #单位元], name_en: [Multiplicative Identity], varName: $1$, value: $R$),
      (name: [#单位元 律], value: [$forall (a : R), 1 dot a = a = a dot 1$]),
    ),
  )
]

#定义条目("交换幺环", "Commutative Unital Ring", uuid: "CommutativeUnitalRing")[
  #同义子句(
    主体: [#交换幺环],
    含义: ([#交换环], [#幺环]),
  )
]

#性质条目("环中乘法零元吸收律", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #环], $a : R$),
    结论: [$0 dot a = a dot 0 = 0$],
  )
]

#性质条目("环中加法逆元与乘法相容", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #环], $a, b : R$),
    结论: [$(-a) dot b = a dot (-b) = -(a dot b)$],
  )
]


== 特殊元素

#定义条目("单位 / 可逆元", "Unit", uuid: "Unit")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #幺环], $u : R$),
    主体: [$u$ 是 #单位],
    isPredicate: true,
    内容: [$exists v : R, u dot v = v dot u = 1$],
  )
]

#定义条目("单位群", "Group of Units", uuid: "UnitGroup")[
  #结构实例子句(
    条件: ([~$(R, +, dot)$ 是 #幺环]),
    主体: [#单位群 $R^times$],
    类别: [#群],
    记号: $R^times$,
    成员: (
      (name: [底集], value: [$\{ u : R \ |\ u $ 是 #单位 $\}$]),
      (name: [乘法], value: [继承 $R$ 中的乘法 $dot$]),
      (name: [#单位元], value: [$R$ 的乘法 #单位元 $1$]),
      (name: [#逆元], value: [每个 $u : R^times$ 取其在 $R$ 中的乘法 #逆元]),
    ),
  )
]

#定义条目("零因子", "Zero Divisor", uuid: "ZeroDivisor")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $a : R$, $a != 0$),
    主体: [$a$ 是 #零因子],
    isPredicate: true,
    内容: [$exists b : R, b != 0 and (a dot b = 0 or b dot a = 0)$],
  )
]

#定义条目("幂零元", "Nilpotent", uuid: "Nilpotent")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #幺环], $a : R$),
    主体: [$a$ 是 #幂零元],
    isPredicate: true,
    内容: [$exists n : bb(N), a^n = 0$],
  )
]

#定义条目("幂等元", "Idempotent", uuid: "Idempotent")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $a : R$),
    主体: [$a$ 是 #幂等元],
    isPredicate: true,
    内容: [$a^2 = a$],
  )
]


== 整环 / 体 / 域

#定义条目("整环", "Integral Domain", uuid: "IntegralDomain")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #整环],
    extends: ([$(R, +, dot)$ 是 #交换幺环],),
    isPredicate: true,
    成员: (
      (name: [非平凡], value: [$1 != 0$]),
      (name: [无零因子], value: [$forall (a, b : R), a dot b = 0 ==> a = 0 or b = 0$]),
    ),
  )
]

#定义条目("除环 / 体", "Division Ring", uuid: "DivisionRing")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #除环],
    extends: ([$(R, +, dot)$ 是 #幺环],),
    isPredicate: true,
    成员: (
      (name: [非平凡], value: [$1 != 0$]),
      (name: [非零元均可逆], value: [$forall (a : R), a != 0 ==> exists b : R, a dot b = b dot a = 1$]),
    ),
  )
]

#定义条目("域", "Field", uuid: "Field")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #域],
    extends: ([$(R, +, dot)$ 是 #除环],),
    isPredicate: true,
    成员: (
      (name: [乘法交换律], value: [$forall (a, b : R), a dot b = b dot a$]),
    ),
  )
]

#定义条目("环的特征", "Characteristic", uuid: "RingCharacteristic")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #幺环]),
    主体: [$R$ 的 #环的特征],
    内容: [满足 $n dot 1 = 0$ 的最小正整数 $n$；若不存在此类 $n$，则规定 #char($R$) $= 0$],
    记号: char($R$),
  )
]

#性质条目("整环的特征是 0 或素数", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #整环]),
    结论: [#char($R$) $= 0$ 或 #char($R$) 为 #素数],
  )
]


== 子环与理想

#定义条目("子环", "Subring", uuid: "Subring")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $S : Set(R)$),
    主体: [$S$ 是 $R$ 的 #子环],
    isPredicate: true,
    内容: [$(S, +|_S, dot|_S)$ 是 #环；在 $R$ 为 #幺环 时还要求 $1 in S$],
  )
]

#定义条目("左理想", "Left Ideal", uuid: "LeftIdeal")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $I : Set(R)$),
    主体: [$I$ 是 $R$ 的 #左理想],
    isPredicate: true,
    内容: [$I$ 是 $R$ 的 #子环，且 $forall (r : R) (x : I), r dot x in I$],
  )
]

#定义条目("右理想", "Right Ideal", uuid: "RightIdeal", isExtension: true)[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $I : Set(R)$),
    主体: [$I$ 是 $R$ 的 #右理想],
    isPredicate: true,
    内容: [$I$ 是 $R$ 的 #子环，且 $forall (x : I) (r : R), x dot r in I$],
  )
]

#定义条目("双边理想 / 理想", "Two-sided Ideal", uuid: "TwoSidedIdeal", isExtension: true)[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $I : Set(R)$),
    主体: [$I$ 是 $R$ 的 #双边理想],
    isPredicate: true,
    内容: [$I$ 同时是 $R$ 的 #左理想 #与 #右理想。在 #交换环 中三者重合，简称 #理想],
  )
]

#定义条目("真理想", "Proper Ideal", uuid: "ProperIdeal")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I$ 是 $R$ 的 #理想]),
    主体: [$I$ 是 $R$ 的 #真理想],
    isPredicate: true,
    内容: [$I != R$],
  )
]

#定义条目("由集合生成的理想", "Ideal Generated by a Set", uuid: "IdealGenerated")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], $S : Set(R)$),
    主体: [由 $S$ 生成的 #理想 $chevron.l S chevron.r$],
    内容: [包含 $S$ 的一切 #理想 之交],
  )
]

#定义条目("主理想", "Principal Ideal", uuid: "PrincipalIdeal")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], [$I$ 是 $R$ 的 #理想]),
    主体: [$I$ 是 #主理想],
    isPredicate: true,
    内容: [$exists a : R, I = (a) := \{ r dot a \ |\ r : R \}$],
  )
]

#定义条目("素理想", "Prime Ideal", uuid: "PrimeIdeal")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], [$P$ 是 $R$ 的 #理想]),
    主体: [$P$ 是 #素理想],
    isPredicate: true,
    内容: [$P$ 是 #真理想，且 $forall (a, b : R), a dot b in P ==> a in P or b in P$],
  )
]

#定义条目("极大理想", "Maximal Ideal", uuid: "MaximalIdeal")[
  #结构子句(
    主体: [$M$ 是 #幺环 $R$ 的 #极大理想],
    extends: ([$M$ 是 $R$ 的 #真理想],),
    isPredicate: true,
    成员: (
      (name: [无更大真理想], value: [$forall J, (J$ 是 $R$ 的 #理想$) and M subset.eq J subset.neq R ==> J = M$]),
    ),
  )
]

#性质条目("极大理想是素理想", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], [$M$ 是 $R$ 的 #极大理想]),
    结论: [$M$ 是 #素理想],
  )
]


== 理想运算

#定义条目("理想的和", "Sum of Ideals", uuid: "IdealSum")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I, J$ 是 $R$ 的 #双边理想]),
    主体: [#理想的和 $I + J$],
    内容: [$\{ a + b \ |\ a in I, b in J \}$，仍为 $R$ 的 #双边理想],
  )
]

#定义条目("理想的积", "Product of Ideals", uuid: "IdealProduct")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I, J$ 是 $R$ 的 #双边理想]),
    主体: [#理想的积 $I dot J$],
    内容: [由集合 $\{ a dot b \ |\ a in I, b in J \}$ 生成的 #双边理想],
  )
]

#定义条目("理想的交", "Intersection of Ideals", uuid: "IdealIntersection")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I, J$ 是 $R$ 的 #双边理想]),
    主体: [#理想的交 $I inter J$],
    内容: [集合交 $\{ x \ |\ x in I and x in J \}$，仍为 $R$ 的 #双边理想],
  )
]

#性质条目("理想运算的包含关系", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I, J$ 是 $R$ 的 #双边理想]),
    结论: [$I dot J subset.eq I inter J subset.eq I + J$],
  )
]


== 商环

#构造条目("商环的构造", "Quotient Ring Construction", uuid: "QuotientRingConstruction")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I$ 是 $R$ 的 #双边理想]),
    主体: [陪集环 $R \/ I$],
    bstyle: "display",
    内容: [
      - 底集：$R \/ I := \{ a + I \ |\ a : R \}$，其中 $a + I := \{ a + x \ |\ x : I \}$。
      - 加法：$(a + I) + (b + I) := (a + b) + I$。
      - 乘法：$(a + I) dot (b + I) := (a dot b) + I$。
      - $I$ 是 #双边理想 保证乘法定义不依赖于陪集代表元的选取。
    ],
  )
]

#定义条目("商环", "Quotient Ring", uuid: "QuotientRing")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I$ 是 $R$ 的 #双边理想]),
    主体: [#环 $R$ 对 #理想 $I$ 的 #商环 $R \/ I$],
    内容: [上述构造给出的 #环；在 $R$ 为 #幺环 时 $R\/I$ 仍为 #幺环，其单位元为 $1 + I$],
  )
]

#性质条目("商环是域当且仅当理想极大", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], [$M$ 是 $R$ 的 #理想]),
    结论: [$R \/ M$ 是 #域 #iff $M$ 是 #极大理想],
  )
]

#性质条目("商环是整环当且仅当理想素", "")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], [$P$ 是 $R$ 的 #理想]),
    结论: [$R \/ P$ 是 #整环 #iff $P$ 是 #素理想],
  )
]


== 环同态

#定义条目("环同态", "Ring Homomorphism", uuid: "RingHomomorphism")[
  #结构子句(
    条件: ([~$(R, +_R, dot_R)$ 与 $(S, +_S, dot_S)$ 是 #环], $f : R -> S$),
    主体: [$f$ 是 $R$ 到 $S$ 的 #环同态],
    isPredicate: true,
    成员: (
      (name: [保加法], value: [$forall (a, b : R), f(a +_R b) = f(a) +_S f(b)$]),
      (name: [保乘法], value: [$forall (a, b : R), f(a dot_R b) = f(a) dot_S f(b)$]),
      (name: [幺环间保单位元], value: [当 $R, S$ 均为 #幺环 时，$f(1_R) = 1_S$]),
    ),
    记号: RHom($R$, $S$),
  )
]

#定义条目("环同态的核", "Kernel", uuid: "RingHomKernel")[
  #定义子句(
    条件: ([~$f : R -> S$ 是 #环同态]),
    主体: [$f$ 的 #环同态的核 $ker(f)$],
    内容: [$\{ a : R \ |\ f(a) = 0_S \}$，为 $R$ 的 #双边理想],
  )
]

#定义条目("环同态的像", "Image", uuid: "RingHomImage", isExtension: true)[
  #定义子句(
    条件: ([~$f : R -> S$ 是 #环同态]),
    主体: [$f$ 的 #环同态的像 $"im"(f)$],
    内容: [$\{ f(a) \ |\ a : R \}$，为 $S$ 的 #子环],
  )
]

#定义条目("环同构", "Ring Isomorphism", uuid: "RingIsomorphism")[
  #定义子句(
    条件: ([~$f : R -> S$ 是 #环同态]),
    主体: [$f$ 是 #环同构],
    isPredicate: true,
    内容: [$f$ 是双射],
  )
]

#定理条目("环第一同构定理", "First Isomorphism Theorem")[
  #定理子句(
    条件: ([~$f : R -> S$ 是 #环同态]),
    结论: [$R \/ ker(f) tilde.equiv "im"(f)$ 作为 #环],
  )
]

#定理条目("环第二同构定理", "Second Isomorphism Theorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$S$ 是 $R$ 的 #子环], [$I$ 是 $R$ 的 #双边理想]),
    结论: [$(S + I) \/ I tilde.equiv S \/ (S inter I)$],
  )
]

#定理条目("环第三同构定理", "Third Isomorphism Theorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I, J$ 是 $R$ 的 #双边理想], $I subset.eq J$),
    结论: [$(R \/ I) \/ (J \/ I) tilde.equiv R \/ J$],
  )
]

#定理条目("理想对应定理", "Correspondence Theorem")[
  #定理子句(
    条件: ([~$(R, +, dot)$ 是 #环], [$I$ 是 $R$ 的 #双边理想]),
    结论: [商映射 $pi : R -> R \/ I$ 在含 $I$ 的 $R$ 的 #双边理想 与 $R \/ I$ 的 #双边理想 之间建立保包含的双射],
  )
]


== 多项式环

#定义条目("多项式环", "Polynomial Ring", uuid: "PolynomialRing")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环]),
    主体: [$R$ 上以 $x$ 为不定元的 #多项式环 $R[x]$],
    bstyle: "display",
    内容: [
      - 底集：$R[x] := \{ (a_0, a_1, dots, a_n) \ |\ n : bb(N), a_i : R \}$，记为 $a_0 + a_1 x + dots.c + a_n x^n$。
      - 加法：逐项相加。
      - 乘法：$(sum_i a_i x^i) dot (sum_j b_j x^j) := sum_k (sum_(i + j = k) a_i dot b_j) x^k$。
      - 在 $R$ 为 #交换幺环 时，$R[x]$ 仍为 #交换幺环，其单位元为常项 $1_R$。
    ],
  )
]

#定义条目("多项式的次数", "Degree of a Polynomial", uuid: "PolynomialDegree")[
  #定义子句(
    条件: ([~$R$ 是 #交换幺环], $f : R[x]$),
    主体: [$f$ 的 #多项式的次数 $deg(f)$],
    内容: [最高非零项的指数；当 $f = 0$ 时规定 $deg(0) = -infinity$],
  )
]

#定义条目("首一多项式", "Monic Polynomial", uuid: "MonicPolynomial")[
  #定义子句(
    条件: ([~$R$ 是 #交换幺环], $f : R[x]$, $f != 0$),
    主体: [$f$ 是 #首一多项式],
    isPredicate: true,
    内容: [$f$ 的 $deg(f)$ 次项系数为 $1_R$],
  )
]

#性质条目("整环上多项式次数加法律", "")[
  #定理子句(
    条件: ([~$R$ 是 #整环], $f, g : R[x]$, $f, g != 0$),
    结论: [$deg(f dot g) = deg(f) + deg(g)$ 且 $R[x]$ 仍为 #整环],
  )
]

#定义条目("不可约多项式", "Irreducible Polynomial", uuid: "IrreduciblePolynomial")[
  #定义子句(
    条件: ([~$R$ 是 #整环], $f : R[x]$),
    主体: [$f$ 是 #不可约多项式],
    isPredicate: true,
    内容: [$f$ 非零、非 #单位，且 $forall (g, h : R[x]), f = g dot h ==> g$ 或 $h$ 是 #单位],
  )
]


== 整除与素元


#定义条目("整除", "Divides", uuid: "Divides")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], $a, b : R$),
    主体: [$a$ #整除 $b$，记作 $a divides b$],
    isPredicate: true,
    内容: [$exists c : R, b = a dot c$],
  )
]

#定义条目("素元", "Prime Element", uuid: "PrimeElement")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], $p : R$),
    主体: [$p$ 是 #素元],
    isPredicate: true,
    内容: [$p != 0$，$p$ 非 #单位，且 $forall (a, b : R), p divides (a dot b) ==> p divides a or p divides b$],
  )
]

#定义条目("不可约元", "Irreducible Element", uuid: "IrreducibleElement")[
  #定义子句(
    条件: ([~$(R, +, dot)$ 是 #交换幺环], $p : R$),
    主体: [$p$ 是 #不可约元],
    isPredicate: true,
    内容: [$p != 0$，$p$ 非 #单位，且 $forall (a, b : R), p = a dot b ==> a$ 或 $b$ 是 #单位],
  )
]

#性质条目("整环中素元是不可约元", "")[
  #定理子句(
    条件: ([~$R$ 是 #整环], [$p : R$ 是 $R$ 的 #素元]),
    结论: [$p$ 是 $R$ 的 #不可约元],
  )
]


== 主理想整环 / 唯一分解整环 / 欧几里得整环

#定义条目("欧几里得整环", "Euclidean Domain", uuid: "EuclideanDomain")[
  #结构子句(
    主体: [$(R, +, dot, delta)$ 是 #欧几里得整环],
    extends: ([$(R, +, dot)$ 是 #整环],),
    isPredicate: true,
    成员: (
      (name: [欧几里得范数], name_en: [Euclidean Norm], varName: $delta$, value: $R \\ \{0\} -> bb(N)$),
      (name: [带余除法], value: [$forall (a : R) (b : R \\ \{0\}), exists q, r : R, a = b dot q + r and (r = 0 or delta(r) < delta(b))$]),
    ),
  )
]

#定义条目("主理想整环", "Principal Ideal Domain", uuid: "PrincipalIdealDomain")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #主理想整环],
    extends: ([$(R, +, dot)$ 是 #整环],),
    isPredicate: true,
    成员: (
      (name: [理想均为主理想], value: [$forall I, I$ 是 $R$ 的 #理想 $==> I$ 是 $R$ 的 #主理想]),
    ),
  )
]

#定义条目("唯一分解整环", "Unique Factorization Domain", uuid: "UniqueFactorizationDomain")[
  #结构子句(
    主体: [$(R, +, dot)$ 是 #唯一分解整环],
    extends: ([$(R, +, dot)$ 是 #整环],),
    isPredicate: true,
    成员: (
      (name: [存在分解], value: [任一非零、非 #单位 元素可写为有限多个 #不可约元 乘积]),
      (name: [唯一性], value: [该分解在相伴与置换顺序下唯一]),
    ),
  )
]

#性质条目("ED 蕴含 PID 蕴含 UFD", "")[
  #定理子句(
    结论: [任一 #欧几里得整环 是 #主理想整环；任一 #主理想整环 是 #唯一分解整环；反向均不成立],
  )
]

#性质条目("UFD 中不可约元等价于素元", "")[
  #定理子句(
    条件: ([~$R$ 是 #唯一分解整环], $p : R$),
    结论: [$p$ 是 $R$ 的 #不可约元 #iff $p$ 是 $R$ 的 #素元],
  )
]


== 分式域

#构造条目("整环的分式域", "Field of Fractions Construction", uuid: "FieldOfFractionsConstruction")[
  #定义子句(
    条件: ([~$R$ 是 #整环]),
    主体: [$R$ 的 #分式域 $"Frac"(R)$],
    bstyle: "display",
    内容: [
      - 在 $R times (R \\ \{0\})$ 上定义等价关系 $(a, b) tilde (c, d) iff a dot d = b dot c$。
      - 底集 $"Frac"(R) := (R times (R \\ \{0\})) \/ tilde$，记等价类 $[(a, b)]$ 为 $a / b$。
      - 加法：$a/b + c/d := (a dot d + b dot c) / (b dot d)$。
      - 乘法：$a/b dot c/d := (a dot c) / (b dot d)$。
      - 该三元组构成 #域。
    ],
  )
]

#定义条目("分式域", "Field of Fractions", uuid: "FieldOfFractions")[
  #定义子句(
    条件: ([~$R$ 是 #整环]),
    主体: [$R$ 的 #分式域 $"Frac"(R)$],
    内容: [上述构造给出的 #域，伴随嵌入 $iota : R arrow.hook "Frac"(R), iota(a) = a / 1$],
  )
]

#性质条目("分式域是包含 R 的最小域", "")[
  #定理子句(
    条件: ([~$R$ 是 #整环], [$K$ 是 #域], [$phi : R -> K$ 是嵌入型 #环同态]),
    结论: [$exists !$ #环同态 $tilde(phi) : "Frac"(R) -> K$ 使 $tilde(phi) compose iota = phi$],
  )
]


#context if 看不看范畴论.get() [

== 环范畴

#定义条目("环范畴", "Category of Rings", uuid: "CategoryOfRings")[
  #结构子句(
    主体: [#环范畴 $bold("Ring")$],
    成员: (
      (name: [对象], value: [全体 #幺环]),
      (name: [态射], value: [幺环之间的 #环同态]),
      (name: [复合], value: [函数复合]),
      (name: [恒态], value: [恒映射 $"id"_R$]),
    ),
  )
]

#性质条目("环范畴中的同构", "")[
  #定理子句(
    条件: ([~$f : R -> S$ 是 $bold("Ring")$ 中的态射]),
    结论: [$f$ 是 $bold("Ring")$ 中的同构 #iff $f$ 是 #环同构],
  )
]

#定义条目("环直积", "Direct Product of Rings", uuid: "RingDirectProduct")[
  #定义子句(
    条件: ([~$R, S$ 是 #幺环]),
    主体: [$R$ 与 $S$ 的 #环直积 $R times S$],
    内容: [逐分量加法与乘法赋予 $R times S$ 以 #幺环 结构，是 $bold("Ring")$ 中 $R$ 与 $S$ 的积],
  )
]

#性质条目("环范畴有积无余积 (交换情形不同)", "")[
  #定理子句(
    结论: [$bold("Ring")$ 有全部小积；余积在 #交换幺环 范畴 $bold("CRing")$ 中为张量积 $R times.circle_(bb(Z)) S$，在 $bold("Ring")$ 中则非平凡],
  )
]

]


== 环论例子

#例条目("零环", "Zero Ring", uuid: "ZeroRing")[
  #定义子句(
    主体: [零环],
    内容: [只含一个元素的 #幺环 $\{0\}$，其中 $0 = 1$],
  )
]

#例条目("整数环", "Integer Ring", uuid: "IntegerRing")[
  #定义子句(
    主体: [整数环 $bb(Z)$],
    内容: [底集为 $bb(Z)$，配以通常的加法与乘法，构成 #交换幺环（且为 #主理想整环、#唯一分解整环、#欧几里得整环，但非 #域）],
  )
]

#例条目("偶整数环", "Even Integer Ring", uuid: "EvenIntegerRing", isExtension: true)[
  #定义子句(
    主体: [偶整数 $2 bb(Z)$],
    内容: [$\{ 2 k \ |\ k : bb(Z) \}$，配以继承自 $bb(Z)$ 的加法与乘法，构成 #交换环 但不构成 #幺环（无单位元 $1$）],
  )
]

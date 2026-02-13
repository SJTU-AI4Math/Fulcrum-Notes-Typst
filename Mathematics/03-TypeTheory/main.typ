#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#show: FulcrumCN

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[集合论])
]

// 目录
#outline(title: "目录", indent: 2em)

// 3. 新开一页
#pagebreak()

= 形式语言

== 基本概念

语境

对象

规则

= *$lambda$-演算*

== *基本规则*

#规则(
  uuid: "Lambda.App",
  "应用",
  "Application",
  [
    给定语境 $Gamma$, *应用*规则以 $Gamma$ 中的项 $f, a$ 构造项, 记作 $f(a)$.
  ],
)

#规则(
  uuid: "Lambda.Abs",
  [$lambda$-抽象],
  [$lambda$-Abstraction],
  [
    给定语境 $Gamma$, *$lambda$-抽象*规则以变量 $x: A$ 和项 $b$ 构造项, 记作 $lambda x: A. b$.
  ],
)

#规则(
  uuid: "Lambda.axiom",
  "公理",
  "Axiom",
  [
    给定语境 $Gamma$, *公理*规则包含以下公理:
  ],
)

== *组合子代数*

#定义(
  uuid: "Omega.Combinator",
  [$Omega$ 组合子],
  [$Omega$ Combinator],
  [$Omega$ 组合子],
  [$(lambda x. x x)(lambda x. x x)$],
)

#注(
  "",
  "",
  [
    注意到 $Omega$ 组合子的 $beta$-规约是不停机的.
  ],
)

= *类型论*

#let Type = optionLink("Type", [$op("Type")$], url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA")
#let Type-decl = (
  obj,
  type,
) => [$obj #optionLink("Type.decl", $:$, url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA") type$]

#let Prop = optionLink("Prop", [$op("Prop")$], url: "https://zh.wikipedia.org/wiki/%E5%91%BD%E9%A2%98")

#let def-CN = (declList, target, body, notation) => [设 #declList, 定义 *#target* 为 #body, 记作 #notation.]

== *函数类型*

#let implies = [$==>$]

== *归纳类型*




// 自然数类型

#let Nat = [$op("Nat")$]
#let Natzero = [$op("zero")$]
#let Natsucc = [$op("succ")$]

#xmp(
  uuid: "Nat",
  "自然数类型",
  "Natural Number Type",
  [
    定义*自然数类型*包含以下构造子:
    + $Natzero : Nat$, 记作 $0$;
    + $Natsucc : Nat -> Nat$.

    记作 $Nat$ 或 $NN$.
  ],
)

= 依值函数

= 函数式编程

== 单子

#let Type = optionLink("Type", [$op("Type")$], url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA")
#let Type-decl = (
  obj,
  type,
) => [$obj #optionLink("Type.decl", $:$, url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA") type$]

#let def-CN = (declList, target, body, notation) => [设 #declList, 定义 *#target* 为 #body, 记作 #notation.]

#struct(
  uuid: "Monad",
  "单子",
  "Monad",
  [
    定义*单子*结构包含以下信息:
    + 自函子: $M: Type -> Type$;
    + 单位元: $eta: A -> M(A)$;
    + 展平 (flatten): $mu: M (M A) -> M A$;
    + 结合 (bind): $: M A -> (A -> M B) -> M B$
  ],
)

#注(
  uuid: "Monad.rmk",
  "",
  "",
  [在有一个自函子映射 $M : Type -> Type$ 的情况下, 我们一般直接称 $M$ 为单子],
)

#let Option = text("Option", font: "Consolas")

#xmp(
  uuid: "Option",
  "Option 单子",
  "Option Monad",
  [
    设 $A$ 为类型, 定义 $Option(A)$ 类型包括以下构造子:
    + $op("None"): Option(A)$;
    + $op("Some"): A -> Option(A)$.

    $Option$ 的单位元 $eta: product_((A: Type)) A -> Option(A)$, 定义为 $op("Some")$.

    $Option$ 的展平 $mu: product_((A: Type)) Option(Option(A)) -> Option(A)$, 定义如下:
  ],
)

#注(
  uuid: "Option.rmk",
  "",
  "",
  [
    假设 $A : Type$, 有两个函数 $f, g$, 它们的计算均是这样的情况:
    + 可能返回一个值 $a : A$;
    + 可能返回空值.

    我们希望有一种办法将 $f$ 和 $g$ 组合, 先执行 $f$ 再执行 $g$, 得到一个等效的组合函数, 记作 $g compose_M f$ 或 $f >>= g$.

    这种组合被称为 Kleisli 组合.

    在 Option 单子中, 我们可以定义 $g compose_M f$ 如下:
    + 如果 $f$ 返回 $op("None")$, 则 $g compose_M f$ 返回 $op("None")$;
    + 如果 $f$ 返回 $op("Some"(a))$, 则执行 $g(a)$ 并返回其结果.

    我们发现运算 $>>= : (A -> Option A) -> (A -> Option A) -> (A -> Option A)$

    若 $(f : A -> Option B), (g : B -> Option C)$, 应当有 $f >>= g : A -> Option C$

    此时, 我们注意到: $forall x : A, (f >>= g)(x) = op("bind") (f(x), g)$

    $ (dot >>= dot) := x mapsto op("bind")(f(x), g) $

    这样就可以用 bind 来定义 Kleisli 组合.

    同理, 通过 flatten 也可以定义 Kleisli 组合:

    注意到 $g : B -> Option(C)$, 于是有: $Option(g) : Option(B) -> Option(Option(C))$

    (这是因为 $Option$ 是 $Type$ 范畴上的自函子, 而 $->$ 是 $Type$ 范畴中的态射)

    于是我们有 $g()$
  ],
)

#let List = text("List", font: "Consolas")

#xmp(
  uuid: "List",
  "List 单子",
  "List Monad",
  [
    设 $A$ 为类型, 定义 $List(A)$ 类型包括以下构造子:
    + $op("nil"): List(A)$;
    + $op("cons"): A -> List(A) -> List(A)$.

    $List$ 的单位元 $eta: product_((A: Type)) A -> List(A)$, 定义为 $op("cons")$.

    $List$ 的展平 $mu: product_((A: Type)) List(List(A)) -> List(A)$, 定义如下:
  ],
)

#注(
  "",
  "",
  [
    我们知道 $NN : Type$, 那么 $List NN : Type$

    $A -> B : Type$, $List (A -> B) = List A -> List B$ ?

    $f, g: A -> B$, 那么有 $[f,g] : List (A -> B)$



    $f : A -> List NN:= a mapsto [1,2]$

    $g : A -> List NN := a mapsto [3,4,5]$

    $[f,g] : A -> List (List NN) := a mapsto [[1,2],[3,4,5]] --> [1,2,3,4,5]$
  ],
)

#xmp(
  "",
  "",
  [
    假设 $m, n$ 是确定的,

    $ root(n, dot) : CC -> op("Set") CC $

    $ root(m, dot) >>= root(n, dot) : CC -> op("Set") CC $

    $root(2, 1) mapsto {-1, 1}$

    $root(3, -1) mapsto {-1, -omega, -omega^2}$

    $root(3, 1) mapsto {1, omega, omega^2}$

    $(root(2, dot) >>= root(3, dot))(1) mapsto op("flatten"){{1,omega,omega^2},{-1,-omega,-omega^2}}={omega_6^i|i=0,dots 5}$
  ],
)

#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../06-OrderTheory/export.typ": *
#import "../08-BasicAlgebra/main.typ": *
#import "../08-BasicAlgebra/export.typ": *
#import "../15-LinearAlgebra/export.typ": *

#show: FulcrumCN
#show: SetStyle

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[表示论])
]

= 群表示论

#约定[
  - $G, KK, V : Type$
  - $dot_G : G -> G -> G$
  - $+_KK : KK -> KK -> KK$
  - $dot_KK : KK -> KK -> KK$
  - $(G, dot_G)$ 是#群
  - $(KK, +_KK, dot_KK)$ 是#域
  - $U, V$ 是 $KK$ 上的#线性空间
  - $dim U, dim V < aleph_0$
]

== 基本定义

#定义(
  uuid: "GroupRepresentation",
  "群表示",
  "Group Representation",
  [$G$ 在 $V$ 上的#群表示],
  [ $GHom(G, GL(V))$],
)

#例(
  uuid: "TrivialRepresentation",
  "平凡表示",
  "Trivial Representation",
)[
  取 $G$ 到 $GL(V)$ 的平凡同态，它是一个 $G$ 的 $V$-表示，称为 $G$ 的平凡表示。
]

#例(
  uuid: "RegularRepresentation",
  "正则表示",
  "Regular Representation",
)[
  设 $n = |G|$，$dim V = n$，考虑 $V$ 的一组基到 $G$ 的双射，令 $G$ 在 $V$ 的作用由 $G$ 在基上的置换诱导得到，这样就得到了 $G$ 的一个 $V$-表示，称为 $G$ 的正则表示。
]

#定义(
  uuid: "PermutationRepresentation",
  "置换表示",
  "Permutation Representation",
  hypotheses: (
    [ $T : Type$],
    $S : Set(T)$,
    $phi: GHom(G, Sym(S))$,
    令($V$, [#自由张成(s: $S$, f: $KK$)]),
  ),
  [$G$ 由 $phi$ 诱导的#置换表示],
  bstyle: "display",
  $ (x : G) mapsto (sum_(s : S) k_s s mapsto sum_(s : S) k_s phi (x)(s)) $,
)

#let 群子表示 = optionLink(
  "GroupSubrepresentation",
  [子表示]
)

#定义(
  uuid: "GroupSubrepresentation",
  "子表示",
  "Subrepresentation",
  hypotheses: ([ $rho$ 是 $G$ 的 $V$-#群表示], [$U$ 是 $V$ 的#线性子空间], [$U$ 是 $rho$ 的#不变子空间]),
  [$G$ 的 $U$-#群子表示],
  [ $Lrestr(rho, U)$],
)

#定义(
  uuid: "GroupQuotientRepresentation",
  "商表示",
  "Quotient Representation",
  hypotheses: (link("SubRepresentation", [同上]), [$Lrestr(rho, U)$ 是 $G$ 的 $U$-#群子表示]),
  [$G$ 的 $V quot U$-商表示],
  bstyle : "display",
  [$ x : G mapsto (v + U) : V Lquot U mapsto (rho(x)(v) + U) $],
)
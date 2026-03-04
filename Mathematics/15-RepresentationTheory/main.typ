#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
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
  - $G, bb(K), V : Type$
  - $dot_G : G -> G -> G$
  - $+_bb(K) : bb(K) -> bb(K) -> bb(K)$
  - $dot_bb(K) : bb(K) -> bb(K) -> bb(K)$
  - $(G, dot_G)$ 是#群
  - $(bb(K), +_bb(K), dot_bb(K))$ 是#域
  - $V$ 是 $bb(K)$ 上的#线性空间
]

==

#定义(
  uuid: "Representation",
  "表示",
  "Representation",
  [$G$ 的 $V$-表示],
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
  uuid: "Subrepresentation",
  "子表示",
  "Subrepresentation",
  hypotheses: ([$rho$ 是 $G$ 的 $V$-表示],),
  [ $G$ 的 $W$-子表示],
  [],
)
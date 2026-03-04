#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let SetStyle = (body) => {
  show math.emptyset : optionLink("Set.empty", $diameter$)
  show math.in: optionLink("Set.mem", $in$, url: "https://zh.wikipedia.org/wiki/%E5%85%83%E7%B4%A0_(%E6%95%B8%E5%AD%B8)")
  show math.complement : optionLink("Set.complement", text($complement$, font: "Sans Serif Collection"))
  show math.subset.eq: optionLink("Set.subset", $subset.eq$, url: "https://zh.wikipedia.org/wiki/%E5%AD%90%E9%9B%86")
  show math.subset: optionLink("Set.subset.remark", $subset$, url: "https://zh.wikipedia.org/wiki/%E5%AD%90%E9%9B%86")
  show math.subset.eq.not: optionLink("Set.subset.remark", $subset.eq.not$, url: "https://zh.wikipedia.org/wiki/%E5%AD%90%E9%9B%86")
  show math.supset: optionLink("Set.subset.remark", $supset$, url: "https://zh.wikipedia.org/wiki/%E5%AD%90%E9%9B%86")
  show math.supset.eq: optionLink("Set.subset.remark", $supset.eq$, url: "https://zh.wikipedia.org/wiki/%E5%AD%90%E9%9B%86")
  show math.supset.eq.not: optionLink("Set.subset.remark", $supset.eq.not$, url: "https://zh.wikipedia.org/wiki/%E5%AD%90%E9%9B%86")
  show math.inter.big: $#math.limits(optionLink("Set.inter.big", $inter.big$, url: "https://zh.wikipedia.org/wiki/%E4%BA%A4%E9%9B%86"))$
  show math.union.big: $#math.limits(optionLink("Set.union.big", $union.big$, url: "https://zh.wikipedia.org/wiki/%E5%B9%B6%E9%9B%86"))$
  body
}

#let Set = type => [
  #optionLink(
    "Set",
    $op("Set")$,
    url: "https://zh.wikipedia.org/wiki/%E9%9B%86%E5%90%88_(%E6%95%B0%E5%AD%A6)",
  )#h(0.2em)#type
]

#let setOf = (name, type: [], body) => [
  #optionLink("setOf", $\{$)#name#if (type != []) [ $:#type$]#optionLink("setOf", [ $|$ ])#body#optionLink(
    "setOf",
    $\}$,
  )
]

#let 不交 = optionLink("Disjoint", [不交], url: "https://zh.wikipedia.org/wiki/%E4%B8%8D%E4%BA%A4%E9%9B%86")
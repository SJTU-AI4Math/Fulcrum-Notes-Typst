#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

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

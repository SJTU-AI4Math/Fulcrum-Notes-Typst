#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let LogicStyle = body => {
  show math.and : optionLink("And", $and$, url: "https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E4%B8%8E")
  show math.or  : optionLink("Or",  $or$,  url: "https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E6%88%96")
  show math.not : optionLink("Not", $not$, url: "https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E9%9D%9E")
  body
}

// 中文 (作为词出现在 CNL 散文里)
#let 与 = optionLink("And", [与], url: "https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E4%B8%8E")
#let 或 = optionLink("Or",  [或], url: "https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E6%88%96")
#let 非 = optionLink("Not", [非], url: "https://zh.wikipedia.org/wiki/%E9%80%BB%E8%BE%91%E9%9D%9E")

// 结构体命题写法 (1. ..., 2. ...) - 用于合取的"分条列出"风格
// 用法: #结构合取(([XX性], [...]), ([YY性], [...]))
#let 结构合取 = (..members) => {
  set enum(indent: 0em)
  align(left)[
    $ cases(#ClauseMembers(members.pos().map(m => {
      if (type(m) == array) {
        (name: m.at(0), value: m.at(1))
      } else { m }
    }))) $
  ]
}

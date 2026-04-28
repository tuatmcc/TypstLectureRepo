#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/showybox:2.0.4": showybox

#let font_sizes = (h1: 18pt, h2: 16pt, h3: 14pt, h4: 12pt, normal: 11pt, math: 12pt)
#let code_fonts = ("Consolas")
#let math_fonts = ("Times New Roman")
#let serif_fonts = ("Harano Aji Mincho")
#let sans_fonts = ("Harano Aji Gothic")

#let leading_size = 1.0em
#let spacing_size = 1.2em

#set heading(numbering: "1.")
#set math.equation(supplement: "式", numbering: numbering.with("(1.1)"))
#set text(font: serif_fonts, size:font_sizes.normal, weight: "regular")
#set par(
  first-line-indent: 1em,
  leading: leading_size,
  spacing: spacing_size,
  justify: true,
)
#set page(
    paper: "a4",
    columns: 1,
    margin:(bottom: 1.0in, top: 1.0in, left: 1.0in, right: 1.0in),
)

#show figure.where(kind: image): set figure(supplement: "図")
#show figure.where(kind: table): set figure(supplement: "表")
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: "code"): set figure(supplement: "コード")
#show figure.where(kind: "結果"): set figure(supplement: "結果")
#show figure.where(kind: "コード"): set block(breakable: true)
#show figure.where(kind: "結果"): set block(breakable: true)
// #show math.equation: set text(font: "Cambria Math", size: font_sizes.math)
// #let fcode(capt, sup: "コード", ..body) = {
//   [#figure(
//     caption: capt,
//     kind: sup,
//     supplement: sup,
//     sourcecode(..body)
//   )]
// }


#show raw: set text(font: code_fonts, size: font_sizes.normal)

#show heading: it => {
  par(text(size: 0pt, "")); v(- spacing_size / 2)
  text(font: sans_fonts, weight: "regular")[#it]
  par(text(size: 0pt, "")); v(- spacing_size / 2)
}

// #set heading(numbering: none)

#counter(page).update(1)
#set page(
  numbering: "1/1"
)

#outline(title: "目次")

= はじめに
このように、文章を書くと自動的に字下げされます。
ただ改行するだけだと段落は変わりません。

１行空けると段落が変わります。

= 基本的な文法

// === 章立て

== 太字

*太字にしたい文字を*囲む

== コードブロック

#figure(
  caption: "コードブロックの例",
  supplement: "コード",
  kind: "コード",
  sourcecode()[
```c
#include <stdio.h>
int main() {
    printf("Hello, World!");
    return 0;
}
```
]
)

== 図
#figure(
  caption: "Typstのロゴ",
  supplement: "図",
  kind: "image",
  image("dummy.png")
)

== 表
#figure(
  caption: "表の例",
  supplement: "表",
  kind: "table",
  table(
    columns: 3,
    stroke: none,
    table.hline(),
    table.header([列1], [列2], [列3]),
    table.hline(),
    [1,1], [1,2], [1,3],
    [2,1], [2,2], [2,3],
    table.hline()
  )
)

= 引用とラベルのすゝめ


== 図と表にラベルを追加する

== 引用してみる



#import "@preview/codelst:2.0.2": sourcecode

#let font_sizes = (h1: 18pt, h2: 16pt, h3: 14pt, h4: 12pt, normal: 11pt, math: 12pt)
#let code_fonts = (
  "Consolas",
  "Cascadia Code",
  "SF Mono",
  "Menlo",
  "DejaVu Sans Mono",
  "Liberation Mono",
  "Noto Sans Mono CJK JP",
)
#let math_fonts = (
  "Cambria Math",
  "STIX Two Math",
  "Latin Modern Math",
  "Times New Roman",
)
#let serif_fonts = (
  "Yu Mincho",
  "Hiragino Mincho ProN",
  "Hiragino Serif",
  "BIZ UDPMincho",
  "Noto Serif CJK JP",
  "Source Han Serif",
  "IPAexMincho",
  "IPAMincho",
  "Harano Aji Mincho",
)
#let sans_fonts = (
  "Yu Gothic",
  "Hiragino Sans",
  "Hiragino Kaku Gothic ProN",
  "BIZ UDPGothic",
  "Noto Sans CJK JP",
  "Source Han Sans",
  "IPAexGothic",
  "IPAGothic",
  "Harano Aji Gothic",
)

#let leading_size = 1.0em
#let spacing_size = 1.2em

#set heading(numbering: "1.")
#set math.equation(supplement: "式", numbering: numbering.with("(1.1)"))
#set text(font: serif_fonts, size: font_sizes.normal, weight: "regular")
#set par(
  first-line-indent: 1em,
  leading: leading_size,
  spacing: spacing_size,
  justify: true,
)
#set page(
  paper: "a4",
  columns: 1,
  margin: (bottom: 1.0in, top: 1.0in, left: 1.0in, right: 1.0in),
)

#show figure.where(kind: image): set figure(supplement: "図")
#show figure.where(kind: table): set figure(supplement: "表")
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: "code"): set figure(supplement: "コード")
#show figure.where(kind: "結果"): set figure(supplement: "結果")
#show figure.where(kind: "コード"): set block(breakable: true)
#show figure.where(kind: "結果"): set block(breakable: true)
#show math.equation.where(block: false): set text(font: math_fonts)
#show math.equation.where(block: true): set text(font: math_fonts, size: font_sizes.math)
#show raw: set text(font: code_fonts, size: font_sizes.normal)

#show heading: it => {
  par(text(size: 0pt, ""))
  v(-spacing_size / 2)
  text(font: sans_fonts, weight: "regular")[#it]
  par(text(size: 0pt, ""))
  v(-spacing_size / 2)
}

#counter(page).update(1)
#set page(numbering: "1/1")

#outline(title: "目次")

= はじめに
このレポートでは、[ここにレポートの目的を書く]。

[まず 1 段落書いてみる。Typst では段落を空行で区切る。]

= 基本的な文法
[この節では、講義中に試した文法を順番に残していく。]

== 章立て
[見出しを 1 つ追加して、階層が変わることを確認する。]

=== 小見出しの例
[必要ならさらに深い見出しも追加する。]

== 太字
[重要な語句を *このように* 強調してみる。]

== 数式
[インライン数式の例: ] $E = m c^2$

[ブロック数式の例: ]
$
sum_(i = 1)^n i = (n (n + 1)) / 2
$

== コードブロック
#figure(
  caption: "[コードの説明を書く]",
  supplement: "コード",
  kind: "code",
  sourcecode()[
```c
// ここにサンプルコードを書く
int main(void) {
    return 0;
}
```
  ]
)<code:example>

[本文から @code:example を参照してみる。]

== 図
#figure(
  caption: "[図の説明を書く]",
  supplement: "図",
  kind: "image",
  image("dummy.png", width: 65%)
)<fig:example>

[本文から @fig:example を参照してみる。]

== 表
#figure(
  caption: "[表の説明を書く]",
  supplement: "表",
  kind: "table",
  table(
    columns: 3,
    align: center,
    stroke: none,
    table.hline(),
    table.header([列 1], [列 2], [列 3]),
    table.hline(),
    [値 1], [値 2], [値 3],
    [値 4], [値 5], [値 6],
    table.hline(),
  ),
)<tab:example>

[本文から @tab:example を参照してみる。]

= 引用とラベルのすゝめ
[図、表、コードのラベルを使うと、番号を手で管理しなくてよくなる。]

== 図と表にラベルを追加する
[図なら `<fig:...>`、表なら `<tab:...>`、コードなら `<code:...>` のようにラベルを付ける。]

== 引用してみる
[たとえば @fig:example や @tab:example のように本文中から参照する。]

== 文献の引用
[文献の引用例: ] @perlinnoise

#bibliography(title: "参考引用文献", "ref.bib", full: true)

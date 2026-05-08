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
// ここに何か書いてみましょう！

= 基本的な文法

== 章立て
//見出し`=`を追加してみましょう。見出しのレベルは`=`の数で決まります。

=== 小見出しの例
//小見出しも同様に`=`の数でレベルを決めます。
== 太字
// "このように"を太字にしてみましょう。(環境によっては太字がうまく表示されないかもしれません。その場合はスキップしても大丈夫です。) 
重要な語句を このように 強調してみる。

== 数式
=== インライン数式
// インライン数式を書いてみよう E = m c^2

=== ブロック数式
// ブロック数式を書いてみよう sum_(i = 1)^n i = (n (n + 1)) / 2

== コードブロック
// 数式をブロックで書いてみよう

== 図
// 図を挿入してみよう

== 表
// 表を挿入してみよう

= 引用とラベルのすゝめ
// ラベルを使用して図や表、コードを参照してみましょう。

== 図と表にラベルを追加する
// [図なら `<fig:...>`、表なら `<tab:...>`、コードなら `<code:...>` のようにラベルを付ける。]

== 引用してみる
// 図、表に追加したラベルを用いて、本文中から参照してみましょう。

== 文献の引用
// bibtex形式で文献の情報を`ref.bib`に記述して、本文中から引用してみましょう。

== 表紙をつけてみよう
// pdfを結合して表紙をつけてみましょう。
#bibliography(title: "参考引用文献", "ref.bib", full: true)

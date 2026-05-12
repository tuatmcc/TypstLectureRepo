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
このレポートでは、Typst の基本的な文法を確認しながら、レポート本文でよく使う要素を一通り試す。文章の構造を見出しとして表現し、図表やコード、数式、文献引用を自動で管理できるようにすることを目的とする。

Typst では、文章の見た目をその場しのぎで整えるのではなく、「これは見出し」「これは図」「これは引用」といった構造を明示して書ける。そのため、あとから図や節を追加しても番号の振り直しを手作業で行う必要がない。

= 基本的な文法
この節では、講義中に扱う最小限の文法をまとめて確認する。

== 章立て
見出しは `=` の数で深さを表現する。たとえばこの節は第 1 章、その下の「章立て」は第 1.1 節に相当する。

=== 小見出しの例
必要に応じて、さらに深い階層の見出しを追加できる。構造を統一しておくと、あとから目次を自動生成しやすい。

== 太字
重要な語句は *このように* 強調できる。ただし、強調だけで構造を表現するのではなく、見出しや箇条書きと役割を分けて使うのが望ましい。

== 数式
インライン数式は本文の流れの中に書ける。たとえば、質量と光速からエネルギーを表す式は $E = m c^2$ のように書ける。

ブロック数式を書くときは、段落から独立した形で次のように記述する。

$
sum_(i = 1)^n i = (n (n + 1)) / 2
$

== コードブロック
#figure(
  caption: "コードブロックの例",
  supplement: "コード",
  kind: "code",
  sourcecode()[
```c
#include <stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}
```
  ]
)<code:hello>

コードも図や表と同じようにキャプション付きで管理できるため、本文中では @code:hello のように参照できる。

== 図
#figure(
  caption: "Typst のロゴ",
  supplement: "図",
  kind: "image",
  image("dummy.png", width: 65%)
)<fig:logo>

図は本文の内容を補足するために用いる。たとえば、講義資料で使用した画像を本文に示すときは @fig:logo のように参照しておくと、番号が自動で追従する。

== 表
#figure(
  caption: "表の例",
  supplement: "表",
  kind: "table",
  table(
    columns: 3,
    align: center,
    stroke: none,
    table.hline(),
    table.header([項目], [値], [備考]),
    table.hline(),
    [実験回数], [3 回], [平均値を使用],
    [測定間隔], [0.1 s], [等間隔に取得],
    [記録方法], [CSV], [後で加工しやすい形式],
    table.hline(),
  ),
)<tab:settings>

表も @tab:settings のように参照できる。途中で行を追加しても、表番号そのものは手で直す必要がない。

= 引用とラベルのすゝめ
レポートでは、「図 1 に示す」「表 1 の設定を用いた」「コード 1 のように実装した」といった参照が頻繁に必要になる。Typst では各要素にラベルを付け、本文からそのラベルを呼び出すことで、参照先と番号を一貫して管理できる。

== 図と表にラベルを追加する
先ほどの図には `<fig:logo>`、表には `<tab:settings>`、コードには `<code:hello>` というラベルを付けた。接頭辞をそろえておくと、本文の可読性も保ちやすい。

== 引用してみる
実際に本文中で参照すると、@fig:logo は図として、@tab:settings は表として、@code:hello はコードとして表示される。これにより、図表を差し替えたり順序を入れ替えたりしても、本文の参照番号は自動で更新される。

== 文献の引用
文献も同様にキーで参照できる。パーリンノイズは滑らかな乱数を生成するアルゴリズムであり、コンピュータグラフィックスの分野で広く利用されている @perlinnoise。

レポート末尾に文献一覧を出力するには、BibTeX 形式のファイルを読み込んで次のように記述する。

#bibliography(title: "参考引用文献", "ref.bib", full: true)

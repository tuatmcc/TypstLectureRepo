---
title: 【Typst】レポート講習会
date: 2026-05-13
authoer: ru322
---

# はじめに
対象者(or)
- レポートを書くのにWordを使っている
- Latexを用いているがTypstに興味がある
- レポートの書き方がわからない

やること
- 
# Typstとは
- いわゆる組版エンジン
- 組版エンジン：書籍や雑誌のレイアウトを文字、画像、表含めて構築するソフトウェア。Word,Canva,Adobe inDesign, Texとか 
# なぜTypstを用いるのか
- Wordは構造を意識して書くのが難しい
    - 章を書くときにただ文字サイズを変えて太字にしてない？
    - 図,表に番号をそのまま書いてない？途中で図を挿入し直したときに番号を振り直してない？
- Tex(LaTex)は環境構築に時間がかかり、コンパイルが遅い
    - Tex Liveで一通りインストールするのに数時間かかる(OverleafとかCloudLaTexあるけど…)
    - コンパイルエラーが非常にわかりにくい

## 余談(読まなくていいです)
基本的にTypstとかTexは決められたレイアウト通りに書く用途に向いています。
逆に自由に配置する用途には向かないです。
でもレポートに自由度なんて基本的に必要ないのでこういったツールが便利という話になります。

> <前略>「パワポ不況 - 麻布論壇」という意見もありますから, 道具が押し付けてくる「流儀」に合わせなきゃなんない理由もありません. でも, 書きたいところに自由にものを配置することは, LaTeX をやったときに説明したと思うけど (覚えてないだろうなー), 実際にはとっても手間がかかる作業です. ワープロや LaTeX なんかは, そういう手間を減らして仕事の能率を上げようっていう道具ですよね (OA - オフィスオートメーションって言うくらいだし). そういうものに乗っからずに自分の思うとおりのことを自由に表現したいってのが <後略>

https://marina.sys.wakayama-u.ac.jp/~tokoi/?date=20091231
# 環境を構築しよう
## VSCodeを入れる
次のURLかインストーラをダウンロード。
Windows環境ならUser Installer x86を入れとけば大体大丈夫。

https://code.visualstudio.com/Download#

インストーラを起動したらインストールウィザードの案内どおりに入れる。「VSCodeで開く」を追加するオプションは入れておいたほうが良い。

## VSCodeにTinymist Tyspt拡張をいれる
[左側のバー]-> [拡張機能] -> [検索バー]

typstと検索して`Tinymist TYpst`拡張機能をインストールする

![Tinymist Typst Install](./img/install-extention.png)

## Gitをインストール
WindowsならWin+Rで「powershell」と打ち込みPowerShellを起動して
```
 winget install --id Git.Git -e --source winget 
```

Macならターミナルから
```
brew install git
```

Linux(Debian/Ubuntu)ならターミナルから
```
sudo apt-get install git-all
```

NixOSなら一時的に使う分には
```
nix-shell -p git
```

## テンプレートをクローンする
```
git clone https://github.com/tuatmcc/TypstLectureRepo
```
## コンパイルしてみる

タブバーあたりにPreview, PDFのアイコンがある。
Previewをクリックすると右側にプレビューが表示される。
PDFをクリックすると同階層にPDFが生成される。

![Preview, PDFアイコン](./img/preview.png)

# 基本的な文法
ここではレポートを書く上で最低限必要な文法を見ていきます。

`template.typ`に実際に記述してみて、どのように表示されるかを実際に確認していきましょう！
## 章立て
「=」で章立できる。
深さは「=」の数で表される。
```
= header 1
== header 2
=== header 3
...
```

## 太字
```
太字にしたい文字を*このように*囲む
```

## コードブロック
````
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
````

## 図
```
#figure(
  caption: "Typstのロゴ",
  supplement: "図",
  kind: "image",
  image("dummy.png")
)
```

## 表
```
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
```
# 引用とラベルのすゝめ
先ほどコードブロックや図、表を挿入する方法を学習しました。これらの要素を文章中で参照する。つまり

> 「図1のように…」「表2のように…」「コードブロック3のように…」

といったことをスマートに行う方法です。
## 図と表にラベルを追加する
先ほど作成した図や表にラベルを追加してみましょう。
`#figure`の後ろに`<fig:example>`のようにラベルを追加することができます。
図であれば`<fig:example>`、表であれば`<tab:example>`、コードブロックであれば`<code:example>`のようにすると区別がついで便利です。
```
#figure(
  caption: "Typstのロゴ",
  supplement: "図",
  kind: "image",
  image("dummy.png")
)<fig:example>
```
## 引用してみる

文章中で先ほど追加したラベルを引用してみましょう。
例えば`<fig:example>`というラベルを追加した図を引用する場合は次のようにします。
```
詳しくは @fig:example を参照。 
```
このようにすることで、図1のように…といった感じで自動的に番号が振られて参照されます。
この方法の利点は、途中で図を追加したり削除したりしても、番号が自動的に振り直されることです。

## 文献の引用

この引用の方法は`#figure`だけでなく、文献の引用にも使うことができます。

基本的にTypstで文献を引用する場合は、BibTeX形式のファイルを用意します。
yaml形式で書く方法も紹介されていますが、なぜか日付がうまく表示されなかったりするので、BibTex形式をおすすめします。

ワークスペースのルートに`ref.bib`というファイルを作成して引用文献の情報を記述していきます。
これは自分で書いても良いのですが、Google Scholarなりで論文だったりを見るとBibTeX形式で引用情報を出力する機能があるので、そちらを利用するのが楽です。

ここでは例としてパーリンノイズの論文 [Improving noise](https://dl.acm.org/doi/abs/10.1145/566570.566636)を引用してみましょう。

URLからExport Citationをクリックして、BibTeXを選択します。
(この辺はサイトによって違うかもしれませんが、基本的にはBibTeX形式で引用情報を出力する機能があるはずです。)

![Export Bib](./img/citation.png)
すると次のようなBibTeX形式の引用情報が得られます。
```
@inproceedings{10.1145/566570.566636,
author = {Perlin, Ken},
title = {Improving noise},
year = {2002},
isbn = {1581135211},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/566570.566636},
doi = {10.1145/566570.566636},
abstract = {Two deficiencies in the original Noise algorithm are corrected: second order interpolation discontinuity and unoptimal gradient computation. With these defects corrected, Noise both looks better and runs faster. The latter change also makes it easier to define a uniform mathematical reference standard.},
booktitle = {Proceedings of the 29th Annual Conference on Computer Graphics and Interactive Techniques},
pages = {681–682},
numpages = {2},
keywords = {procedural texture},
location = {San Antonio, Texas},
series = {SIGGRAPH '02}
}
```
この情報を`ref.bib`に記述します。
複数の文献を引用する場合は、追記していけば大丈夫です。

今回のケースでは引用キーが`10.1145/566570.566636`になっていますが、これでもどうにかなるといえばなりますが、`@`での引用ができなくなるので、引用キーを`perlinnoise`というようにわかりやすいものに変更しておくと便利です。


次のこの文献を引用していきましょう。typstファイルの末尾に次のように記述します。
```
#bibliography(title: "参考引用文献", "ref.bib", full: true)
```
これで参考引用文献のセクションができて、先ほど`ref.bib`に記述した文献が表示されるようになります。

レポート中でこの文献を引用する場合は、次のようにします。
```
詳しくは @perlinnoise を参照。
```

最終的には次のような感じで表示されるようになります。
![引用の例](./img/bib.png)
# APPENDIX

ここから先は蛇足的なな内容になります。Typstを用いてレポートを書く上で必須な内容ではないので、興味がある人だけ読んでみてください。(と言いつつMatplotlib, Git/GitHubの内容は頭に入れておいたほうが良いかも)
## Matplotlibでグラフを作成する
レポートを作成する上で、グラフを作成する必要がある場合も多いと思います。
Excelを用いても良いのですが、あまり綺麗なグラフができなかったり、細かい調整が難しかったりします。
PythonのMatplotlibを用いると、綺麗なグラフを作成することができます。

### Astral UVのインストール
Pythonのパッケージマネージャであるuvを用いてmatplotlibをインストールします。
今回は今レポートを書いている環境にインストールして行きますが、プログラミング演習などWSL環境でプログラムを書いている人はそちらでインストールしたほうが良いかも？
Windows環境
```
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

macOS/Linux(WSL)環境
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### VSCodeにJupyter拡張機能を入れる
VSCodeの拡張機能からJupyterを検索してインストールします。

![Jupyter Extension](./img/install-jupyter.png)
### Matplotlibをインストールする

自分で環境構築する場合は
```sh
#あくまで参考
uv init
uv add matplotlib
uv add ipykernel
uv add matplotlib-fontja
``` 
のようにして環境を構築します。
今回はすでに`pyproject.toml`が用意されているので、次のコマンドで環境に入ることができます。
```sh
uv sync
```
## Git/GitHubでレポートを管理する

## 実はチューリング完全なTypst

## コーディングエージェントでレポートを…



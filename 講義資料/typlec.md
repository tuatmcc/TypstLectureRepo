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

## 余談
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

## 図と表にラベルを追加する

## 引用してみる

# APPENDIX

## Matplotlibでグラフを作成する

## Git/GitHubでレポートを管理する

## 実はチューリング完全なTypst

## コーディングエージェントでレポートを…



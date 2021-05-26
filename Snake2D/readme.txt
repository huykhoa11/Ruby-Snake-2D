DXRuby スターターキット 1.4.0 with ruby2.0.0

１．はじめに

 「インストール一切不要！ メモ帳一本でゲームが作れる開発環境(Windows用)」、yhara氏作のスターターキットDXRuby版です。
 スクリプト言語RubyとゲームライブラリDXRubyをパッケージングしてあり、Ruby及びDXRubyのインストール無しに、Rubyで書いたゲームのスクリプトを実行することができます。


２．使い方

 まず、Rubyでスクリプトを記述し、main.rbと言う名前で保存します。
 次に、main.rbとDXRubyスターターキット同梱のgame.exeを同じディレクトリに置きます。
 そして、game.exeを実行すると、main.rbが読み込まれて実行されます。

 また、game.exeのかわりにdevelopment.exeを実行すると、標準出力を表示するためのウィンドウが表示されますので、putsなどのメソッドでデバッグ情報を確認することができます。
 DXRubyのクラス・モジュールに関しては、同梱のDXRubyリファレンス.chmを参照してください。

 同梱のmain.rbはダイアログを開いてファイルを選択するものが入っていますので、sample.rbやsampleフォルダの中のものを選んで実行してみてください。だいたいどんなことができるかわかるんじゃないかと思います。


３．仕組みなど

 DXRubyスターターキットは、Ruby2.0.0-p195(mingw32)とWin32API、DXRuby1.4.0、DXRubyExtension1.0.4をパッケージングしてocraでexe化したものです。
 ですのでDXRubyプロジェクトWebで公開されているvox.rbやbass.rbも動作させることができます。
 DXRubyスターターキットにはmain.rbを読み込んで実行するスクリプトが組み込まれています。


４．注意点

 exeに組み込まれているスクリプトはしょっぱな#!ruby -Ksが書かれているのでRuby1.8をお使いの方は文字はすべてシフトJISで書いてください。Ruby1.9以降ではマジックコメントを書けば好きな文字コードが使えます。


５．ライセンス関連

 DXRubyスターターキットのうち、game.exe、development.exeはGPL、同梱のサンプルはパブリックドメインとなります。

 game.exe、development.exeから呼ばれるゲームスクリプトのほうはGPLの影響を受けませんので、お好きなライセンスを適用してください。

オブジェクト指向スクリプト言語rubyの公式サイト
http://www.ruby-lang.org/ja/

DXRubyプロジェクトWeb
http://dxruby.sourceforge.jp/

yhara氏のサイト
http://mono.kmc.gr.jp/~yhara/w/


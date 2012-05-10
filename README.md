# Emacsの設定ファイルを公開
.emacs.dの中身を公開するようにしました。少しづつ整理しております。

## 構造
* init.el conf/init.elを読むだけ
* conf/init.el
  * conf/basic.el Emacsの versionに関係なく動作する設定を集め中
  * conf/util.el これ以降の設定で使用できる関数定義
  * conf/数値-* 数値の順番どおりに読み込みます。

### conf/数値-* について
* 00 未整理
* 10 見栄えに関するもの
* 10-autoinstall.el auto-installを利用してるもの
* 20 フレームワーク的なもの helm, anything, auto-complete
* 50 主にメジャーモード系の設定
* 60- どうしても後じゃないとこまるもの
* 80,90 実験中

## 環境変数 PATH について
init.elの最後で exec-path の値をsetenvしているので、exec-pathへadd-to-listしていく。

## TODO
* 個々のファイルをできるだけ単体で利用できる形になおしてく。

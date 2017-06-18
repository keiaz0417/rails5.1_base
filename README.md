# Ruby on Rails 5.1 ベースプロジェクト
init.shを実行するだけで、Rails5.1をインストールしたプロジェクトを作成できるようにする。  
以下のCodeZineの記事を参考に作成。環境構築や各種ツールの説明は、記事を見てもらったほうが早い。  
https://codezine.jp/article/detail/9743?p=3

## 使い方
前提条件：macOS, git, rbenv, bundler, postgresqlインストール済。rbenvにてRuby2.4.0インストール済。
1. レポジトリをクローン
```bash
$ git clone git@github.com:keiaz0417/rails5.1_base.git
```
2. init.shを実行
```bash
$ cd rails5.1_base
$ chmod +x init.sh
$ ./init.sh
```
3. 余計なファイルを削除
```bash
$ rm -rf init.sh README.md .git
```
4. プロジェクト作成  
-dオプションで使用するデータベースを指定する。ここではpostgresqlとしている。  
以下のコマンドを実行すると、"Overridde ~~~ /Gemfile? ~~~ [Ynaqdh]"と聞かれるのでYと入力しエンター。
```bash
$ bundle exec rails new . -d postgresql
```
5. サーバー起動
```bash
$ bin/rails s
```

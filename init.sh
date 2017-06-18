#!/bin/bash

# Default value
RUBY_VERSION=2.4.0
ERR_MSG="次のコマンドを実行できません："

# プロジェクト用Rubyバージョン固定
if which rbenv > /dev/null; then
    rbenv local $RUBY_VERSION
else
    echo $ERR_MSG "rbenv"
    exit 1
fi


# bundler初期化
if which bundle > /dev/null; then
    bundle init
else
    echo $ERR_MSG "bundle"
    exit 1
fi

if [ ! -e Gemfile ]; then
    echo "Genfileが存在しません。"
    exit 1
fi

# Gemfile 書き換え - railsのコメントイン
sed -i -e 's/^# gem/gem/g' Gemfile
rm Gemfile-e

# Ruby on Rails インストール
bundle install --path vendor/bundle --jobs 4

if bundle exec rails -v > /dev/null; then
    echo "Ruby on Railsのインストールを完了しました。"
else
    echo "Ruby on Railsのインストールに失敗しました。"
    exit 1
fi

exit 0


#!/bin/bash

set -eu

# Bundlerの依存関係をチェックしておく
bundle check || true

# Yarnの依存関係をチェックしておく
yarn check --integrity --silent || true

# Railsサーバーを実行する場合PIDファイルがあれば削除しておく
if [ "${1:-}" = rails -a "${2:-}" = server ]; then
  if [ -f tmp/pids/server.pid ]; then
    rm -v tmp/pids/server.pid
  fi
fi

exec "$@"

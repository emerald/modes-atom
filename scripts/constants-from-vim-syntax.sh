#!/usr/bin/env bash

set -euo pipefail

needle="syn +keyword +Constant +"

scope="language.constant"

prefix="  {\n    match: '\\\\\\\\b(?i)("
suffix=")\\\\\\\\b'\n    name: '${scope}'\n  }/"

cat ~/.vim/syntax/emerald.vim | \
  egrep "${needle}" | \
  perl -pe "s/${needle}(.*)/\1/" | \
  perl -pe "s/ +/|/g" | \
  perl -pe "s/(.*)/${prefix}\1${suffix}"

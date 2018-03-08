#!/usr/bin/env bash

set -euo pipefail

needle="syn +match +Comment +"

scope="comment"

prefix="  {\n    match: '"
suffix="'\n    name: '${scope}'\n  }/"

cat ~/.vim/syntax/emerald.vim | \
  egrep "${needle}" | \
  perl -pe "s/${needle}(.*)/\1/" | \
  perl -pe "s/\"(.*)\"/${prefix}\1${suffix}"

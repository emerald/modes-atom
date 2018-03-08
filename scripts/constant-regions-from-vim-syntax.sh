#!/usr/bin/env bash

set -euo pipefail

needle="syn +region +Constant +"

scope="string.quoted"

cat ~/.vim/syntax/emerald.vim | \
  egrep "start='\"'" | \
  perl -pe "s/$/\n    name: '${scope}'\n  }/" | \
  perl -pe "s/.*?start='/  {\n    begin: '/" | \
  perl -pe "s/ +skip='/\n    patterns: [ { match: '/" | \
  perl -pe "s/ +end='/ } ]\n    end: '\1/" | \
  perl -pe "s/\\\\/\\\\\\\\/g"

scope="constant.character"

cat ~/.vim/syntax/emerald.vim | \
  egrep "start='\\\\''" | \
  perl -pe "s/$/\n    name: '${scope}'\n  }/" | \
  perl -pe "s/.*?start='/  {\n    begin: '/" | \
  perl -pe "s/ +skip='/\n    patterns: [ { match: '/" | \
  perl -pe "s/ +end='/ } ]\n    end: '\1/"

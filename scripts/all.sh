#!/usr/bin/env bash

set -euo pipefail

cat \
  <(./keywords-from-vim-syntax.sh) \
  <(./types-from-vim-syntax.sh) \
  <(./constants-from-vim-syntax.sh) \
  <(./constant-regions-from-vim-syntax.sh) \
  <(./comments-from-vim-syntax.sh)

#!/usr/bin/env bash

set -euo pipefail

./all.sh | \
  xclip -selection clipboard

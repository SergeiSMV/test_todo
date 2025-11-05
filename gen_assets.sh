#!/bin/zsh

YELLOW='\033[0;33m'
DEFAULT='\033[0m'
GREEN='\033[1;32m'

echo
echo "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"
echo "${YELLOW}━━ 🖼️  Run Assets generate (AppAssets)... 🖼️  ━━${DEFAULT}"
echo "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"

fluttergen

echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"
echo "${GREEN}━━━━━━━━━━━━━━━━ 🎉 Done! 🎉 ━━━━━━━━━━━━━━━━━${DEFAULT}"
echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"
echo

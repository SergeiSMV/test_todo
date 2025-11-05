#!/bin/zsh

CYAN='\033[0;36m'
GREEN='\033[0;32m'

DEFAULT='\033[0m'

echo
echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"
echo "${CYAN}━━━━━━━━━━━━━ 🌍 Run slang... 🌍 ━━━━━━━━━━━━━${DEFAULT}"
echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"

dart run slang

echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"
echo "${GREEN}━━━━━━━━━━━━━━━━ 🎉 Done! 🎉 ━━━━━━━━━━━━━━━━━${DEFAULT}"
echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${DEFAULT}"
echo
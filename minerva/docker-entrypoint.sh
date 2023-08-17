#!/bin/bash

VERSION="1.1.0"

if ([[ -t 1 ]] && [[ $(tput colors) -ge 8 ]]) || [[ "${WEBCALL}" ]]; then
  COL_BOLD='[1m'
  COL_ULINE='[4m'
  COL_NC='[0m'
  COL_GRAY='[90m'
  COL_RED='[91m'
  COL_GREEN='[32m'
  COL_YELLOW='[33m'
  COL_BLUE='[94m'
  COL_PURPLE='[95m'
  COL_CYAN='[96m'
else
  COL_BOLD=""
  COL_ULINE=""
  COL_NC=""
  COL_GRAY=""
  COL_RED=""
  COL_GREEN=""
  COL_YELLOW=""
  COL_BLUE=""
  COL_PURPLE=""
  COL_CYAN=""
fi

ERROR="${COL_RED}x${COL_NC}"
INFO="${COL_BLUE}i${COL_NC}"
QUESTION="${COL_PURPLE}?${COL_NC}"
SUCCESS="${COL_GREEN}✓${COL_NC}"
WARNING="${COL_YELLOW}!${COL_NC}"

STR_ERROR="[${ERROR}]"
STR_INFO="[${INFO}]"
STR_QUESTION="[${QUESTION}]"
STR_SUCCESS="[${SUCCESS}]"
STR_WARNING="[${WARNING}]"

echo -e "${COL_BOLD}Minerva Server Controller v${VERSION} - $1${COL_NC}"

function start() {
  pushd "/server" > /dev/null || exit
  ./Minerva
}

case $1 in
  -h | --help)
    usage
    exit
    ;;
  start)
    start "$2"
    ;;
  *)
    echo "usage: $0 start" >&2
    exit 1
    ;;
esac

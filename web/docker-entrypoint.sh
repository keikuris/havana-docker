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

echo -e "${COL_BOLD}HavanaWeb Server Controller v${VERSION} - $1${COL_NC}"

function start() {
  pushd "/server" > /dev/null || exit
  until [[ $(mysql -h habbo_db -u havana -pverysecret -e "SHOW TABLES LIKE 'wordfilter'" havana) ]]; do
    echo -e "${STR_INFO} Database table 'wordfilter' does not exist. Waiting..."
    sleep 1
  done
  echo -e "${STR_SUCCESS} Done. Starting server..."
  java \
    -Djava.net.preferIPv4Stack=true \
    -Djava.net.preferIPv4Addresses=true \
    -classpath Havana-Web.jar:lib/ini4j-0.5.4.jar:lib/pebble-3.1.5.jar:lib/Havana-Server.jar:lib/HikariCP-3.4.1.jar:lib/mariadb-java-client-2.3.0.jar:lib/commons-configuration2-2.2.jar:lib/commons-text-1.5.jar:lib/htmlcompressor-maven-plugin-1.3.jar:lib/commons-io-2.5.jar:lib/velocity-tools-2.0.jar:lib/struts-taglib-1.3.8.jar:lib/struts-tiles-1.3.8.jar:lib/struts-core-1.3.8.jar:lib/commons-validator-1.6.jar:lib/geoip2-2.12.0.jar:lib/httpclient-4.5.5.jar:lib/duckHTTPD-all.jar:lib/jsoup-1.13.1.jar:lib/slf4j-log4j12-1.7.25.jar:lib/gson-2.8.0.jar:lib/mail-1.4.7.jar:lib/lazysodium-java-5.0.1.jar:lib/resource-loader-2.0.1.jar:lib/jna-5.8.0.jar:lib/unbescape-1.1.6.RELEASE.jar:lib/slf4j-api-1.7.30.jar:lib/commons-lang3-3.9.jar:lib/commons-chain-1.1.jar:lib/commons-digester-1.8.1.jar:lib/commons-beanutils-1.9.2.jar:lib/commons-logging-1.2.jar:lib/velocity-1.6.2.jar:lib/commons-collections-3.2.2.jar:lib/httpcore-4.4.9.jar:lib/commons-codec-1.10.jar:lib/netty-all-4.1.33.Final.jar:lib/log4j-1.2.17.jar:lib/commons-lang-2.6.jar:lib/spring-security-crypto-5.7.3.jar:lib/bcprov-jdk15on-1.70.jar:lib/chesslib-1.1.1.jar:lib/htmlcompressor-1.5.2.jar:lib/yuicompressor-2.4.6.jar:lib/jsp-api-2.1.jar:lib/json-20090211.jar:lib/maven-plugin-api-3.0.3.jar:lib/activation-1.1.jar:lib/maxmind-db-1.2.2.jar:lib/jackson-databind-2.9.5.jar:lib/jackson-core-2.9.5.jar:lib/jackson-annotations-2.9.5.jar:lib/js-1.6R7.jar:lib/dom4j-1.1.jar:lib/oro-2.0.8.jar:lib/sslext-1.2-0.jar:lib/maven-model-3.0.3.jar:lib/maven-artifact-3.0.3.jar:lib/sisu-inject-plexus-2.1.1.jar:lib/antlr-2.7.2.jar:lib/plexus-utils-2.0.6.jar:lib/plexus-component-annotations-1.5.5.jar:lib/plexus-classworlds-2.4.jar:lib/sisu-inject-bean-2.1.1.jar:lib/sisu-guice-2.9.4-no_aop.jar \
    org.alexdev.http.HavanaWeb
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

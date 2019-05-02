#!/bin/sh

CURDIR=$(dirname $0);

case $@ in
  "serve")
    ${CURDIR}/serve.sh;
  ;;
  "init")
    ${CURDIR}/init.sh;
  ;;
  "init-theme")
    ${CURDIR}/init.sh theme;
  ;;
  "init-site")
    ${CURDIR}/init.sh site;
  ;;
  "version")
    ${CURDIR}/version.sh;
  ;;
  *)
    ${CURDIR}/help.sh;
  ;;
esac

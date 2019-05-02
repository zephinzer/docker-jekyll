#!/bin/sh

init_site() {
  mkdir -p ./sites;
  cd ./sites \
    && jekyll new site \
    && cd ..;
  cp -r ./sites/site/* ./;
  rm -rf ./sites;
}

init_theme() {
  mkdir -p ./themes;
  cd ./themes \
    && jekyll new-theme theme \
    && rm -rf ./theme/.git \
    && cd ..;
  cp -r ./themes/theme/* ./;
  rm -rf ./themes;
}

case $@ in
  "site")
    init_site
  ;;
  "theme")
    init_theme
  ;;
  *)
    init_theme
    init_site
  ;;
esac


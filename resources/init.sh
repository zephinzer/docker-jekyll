#!/bin/sh
mkdir -p ./sites;
cd ./sites \
  && jekyll new site \
  && cd ..;

mkdir -p ./themes;
cd ./themes \
  && jekyll new-theme theme \
  && cd ..;

cp -r ./themes/theme/.* ./;
rm -rf ./themes;

cp -r ./sites/site/* ./;
rm -rf ./sites;

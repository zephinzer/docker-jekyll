#!/bin/sh

printf -- 'zephinzer/jekyll:latest\n';
printf -- '^^^^^^^^^^^^^^^^^^^^^^^\n';

RUBY="$(ruby --version | cut -f 2 -d ' ')";
GEM="$(gem --version)";
RAKE="$(rake --version | cut -f 3 -d ' ')";
JEKYLL="$(jekyll --version | cut -f 2 -d ' ')";

echo "
Ruby     : ${RUBY}
Gem      : ${GEM}
Rake     : ${RAKE}
Jekyll   : ${JEKYLL}

Commands :

  init
    - creates a new site with a blank theme

  init-site
    - creates a new site

  init-theme
    - creates a new theme

  serve
    - serves the directory

  version
    - displays the version of all relevant modules

  help
    - displays this help text
";


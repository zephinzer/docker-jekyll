#!/bin/sh
GEM="$(gem --version)";
JEKYLL="$(jekyll --version | cut -f 2 -d ' ')";
RAKE="$(rake --version | cut -f 3 -d ' ')";
RUBY="$(ruby --version | cut -f 2 -d ' ')";
printf -- "ruby${RUBY}_gem${GEM}_rake${RAKE}_jekyll${JEKYLL}";

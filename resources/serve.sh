#!/bin/sh
bundle install;
jekyll serve \
  --host 0.0.0.0 \
  --livereload \
  --livereload-port ${PORT_LIVERELOAD:-4001} \
  --port ${PORT:-4000};

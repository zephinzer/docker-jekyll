FROM ruby:2.6.3-alpine3.9 AS base
RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add --no-cache g++ make git
RUN gem install bundler jekyll rake
# this is used for routing sub-commands
COPY ./resources/entrypoint.sh /
RUN ln -s /entrypoint.sh /entrypoint \
  && chmod +x /entrypoint
# this is used for versioning
COPY ./resources/version.sh /
RUN ln -s /version.sh /version \
  && chmod +x /version
# this is used for serving
COPY ./resources/serve.sh /
RUN ln -s /serve.sh /serve \
  && chmod +x /serve
# this is used for initialisation
COPY ./resources/init.sh /
RUN ln -s /init.sh /init \
  && chmod +x /init
# this is used for the help text
COPY ./resources/help.sh /
RUN ln -s /help.sh /help \
  && chmod +x /help
# this next `chmod` seems necessary to run as someone other than root
RUN mkdir -p /usr/local/bundler /usr/local/bundle \
  && chmod 777 -R /usr/local/bundler /usr/local/bundle
WORKDIR /jekyll
ENTRYPOINT ["/entrypoint"]

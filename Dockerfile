FROM ruby:2.6.3-alpine3.9 AS base
RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add --no-cache g++ make git
RUN gem install bundler jekyll rake
# this is used for versioning
COPY ./resources/version.sh /version
RUN chmod +x /version
# this is used for serving
COPY ./resources/serve.sh /serve
RUN chmod +x /serve
# this is used for initialisation
COPY ./resources/init.sh /init
RUN chmod +x /init
# this next `chmod` seems necessary to run as someone other than root
RUN mkdir -p /usr/local/bundler /usr/local/bundle \
  && chmod 777 -R /usr/local/bundler /usr/local/bundle
WORKDIR /jekyll
ENTRYPOINT ["/serve"]

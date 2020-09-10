FROM ruby:2.6.1-alpine

# Package Dependencies
USER root

RUN apk upgrade --no-cache -U && \
    apk add --no-cache --virtual bash && \
    apk add --no-cache --virtual build-base && \
    apk add --no-cache --virtual gcc && \
    apk add --no-cache --virtual make && \
    apk add --no-cache --virtual mariadb-dev && \
    apk add --no-cache --virtual mysql-client && \
    apk add --no-cache --virtual nodejs && \
    apk add --no-cache --virtual tzdata && \
    apk add --no-cache --virtual yarn && \
    apk add --no-cache --virtual zlib-dev

RUN mkdir /opt/deploy-me
WORKDIR /opt/deploy-me

COPY Gemfile /opt/deploy-me/Gemfile
COPY Gemfile.lock /opt/deploy-me/Gemfile.lock
RUN gem install bundler
RUN bundle install -j 4 


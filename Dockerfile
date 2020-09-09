FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Chicago

RUN apt-get update
RUN apt-get install -yq build-essential \
                        zlib1g-dev \
                        openssl \
                        libssl-dev \
                        curl \
                        git \
                        libmysqlclient-dev \
                        tzdata \
                        ruby ruby-dev \
                        nodejs \
                        yarnpkg

RUN ln -s /usr/bin/yarnpkg /usr/bin/yarn

# Configure Gems
RUN gem update --system
RUN gem install bundler

WORKDIR /opt/buildout
COPY Gemfile /opt/buildout/Gemfile
COPY Gemfile.lock /opt/buildout/Gemfile.lock

RUN bundle install -j 4 --with=test --without=webdrivers --system

#!/usr/bin/env sh

export RAILS_ENV="development"

bundle install
yarn install

bundle exec rails console

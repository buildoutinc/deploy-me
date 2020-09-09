#!/usr/bin/env sh

export RAILS_ENV="development"

bundle install
bundle exec sidekiq -C config/sidekiq.yml

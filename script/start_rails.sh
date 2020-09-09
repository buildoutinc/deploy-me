#!/usr/bin/env sh

export RAILS_ENV="development"

bundle install -j 4
yarn install

wait4ports redis=tcp://redis:6379 mysql=tcp://mysql:3306
bundle exec rake db:migrate
bundle exec rails server -b 0.0.0.0 -p 3000

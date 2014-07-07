#! /usr/bin/env bash

bundle exec rake assets:precompile
bundle exec rake db:create db:migrate db:seed
RAILS_ENV=production bundle exec rails s

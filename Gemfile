source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'angularjs-rails'
gem 'rails-latex', github: 'danfinnie/rails-latex', branch: 'both-changes'
gem 'maruku'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

group :development do
  gem 'cheat'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
end

group :development, :test do
  gem 'pry'
  gem 'launchy'
end

group :test do
  gem 'rspec'
  gem 'simple_bdd', require: ['simple_bdd', 'simple_bdd/rspec']
  gem 'rspec-rails'
  gem 'capybara'
  gem 'spring-commands-rspec'
  gem 'poltergeist'
  gem 'database_cleaner'
end

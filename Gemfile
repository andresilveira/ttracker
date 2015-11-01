ruby '2.2.3'
source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotusrb',     '0.5.0'
gem 'lotus-model', '~> 0.5'

gem 'haml'

gem 'pg'

gem 'mechanize'

gem 'sidekiq'
gem 'font-awesome-sass'

group :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'capybara'
  gem 'rack-test'
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: false
  gem 'vcr'
  gem 'webmock'
  gem 'minitest-vcr'
end

group :development do
  gem 'guard'
  gem 'guard-minitest'
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'pry'
end

group :development, :production do
  gem 'puma'
end

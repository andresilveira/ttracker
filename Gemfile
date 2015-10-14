source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotusrb',     '0.5.0'
gem 'lotus-model', '~> 0.5'

gem 'haml'

gem 'pg'

gem 'mechanize'

group :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'capybara'
  gem 'rack-test'
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

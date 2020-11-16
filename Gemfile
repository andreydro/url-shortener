source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'json'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
gem 'resque'
gem 'rest-client'
# gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'validate_url'
gem 'webpacker', '~> 5.2.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-nav', '0.3.0'
  gem 'pry-rails', '0.3.9'
  gem 'rspec-rails'
  gem 'rubocop', '0.80.1', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

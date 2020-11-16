source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.0'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 5.2.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
gem "json"
gem "resque"
gem 'bootsnap', '>= 1.4.2', require: false
gem 'validate_url'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-nav', '0.3.0'
  gem 'pry-rails', '0.3.9'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '0.80.1', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

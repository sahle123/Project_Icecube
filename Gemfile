source 'http://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.1.0'
gem "therubyracer"
#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  #gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
end
group :production do
  gem 'pg'
	gem 'activerecord-postgresql-adapter'
  gem 'bootstrap_helper'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  #gem 'sass-rails', "  ~> 3.1.0"
  #gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'

source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
#gem 'roar'
gem 'draper'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4' #compile sass (css with variables and functions, etc)
  gem 'coffee-rails', '~> 3.1.1' #compile coffescript simplified javascript
  gem 'uglifier', '>= 1.0.3' #compress javascript and css
end

gem 'jquery-rails'

gem 'haml' #haml (simplified html for improved readability) template engine, instead of embedded ruby in regular html
gem 'compass' #css framework

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development] # testing framework
group :test do
  gem "factory_girl_rails"
  gem "forgery" # generate fake names, emails, and dummy text
  gem "capybara" # programmatically navigate the web for testing
  gem "guard-rspec"
  gem "cucumber-rails"
  gem "guard-cucumber"
  gem 'pickle' # some steps for cucumber
  gem 'turn', '< 0.8.3', :require => false # Pretty printed test output
  gem 'spork' #forking and test servers
  gem 'guard-spork'
end

# growl notification gem for mac
gem "growl", :group => [:test, :development] if (RbConfig::CONFIG['host_os'].include? "darwin")

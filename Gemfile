source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'sass-rails',   '~> 3.1.4' #compile sass (css with variables and functions, etc)
  gem 'coffee-rails', '~> 3.1.1' #compile coffescript simplified javascript
  gem 'uglifier', '>= 1.0.3' #compress javascript and css
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]
gem "rspec-rails", :group => [:test, :development] # testing framework
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "capybara" # programmatically navigate the web for testing
  gem "guard-rspec"
  gem "cucumber-rails"
  gem "guard-cucumber"
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'turn', :require => false # Pretty printed test output
  gem 'spork' #forking and test servers
end

gem "growl", :group => [:test, :development] if (Config::CONFIG['host_os'].include? "darwin")
# growl notification gem for mac
gem "growl", :group => [:test, :development] if (RbConfig::CONFIG['host_os'].include? "darwin")

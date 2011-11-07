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
  gem 'bootstrap-sass', '1.3.1'
end

gem 'jquery-rails'

gem 'sunspot_rails', '1.3.0.rc6'

group :development do
  
  # Run a local Solr instance in development
  gem 'sunspot_solr', '1.3.0.rc6'
  
  # Foreman is great for managing running processes
  gem 'foreman', '0.25.0'
  
  # Show indexing progress
  gem 'progress_bar', '0.4.0'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

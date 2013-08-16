source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'rails-api' #Rails on API mode

gem 'sqlite3', group: [:development, :test]# Use sqlite3 as the database for Active Record
gem 'pg', group: :production #For heroku
gem 'warden', '1.2.3'
gem 'devise'
gem 'cancan' #For authorization
gem 'active_model_serializers'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]

#Testing
gem "rspec-rails", :group => [:development, :test] #Unit test framework
gem "database_cleaner", :group => :test #For cleaning database during unit tests
gem "cucumber-rails", :group => :test, :require => false #Behaviour driven development
gem "factory_girl_rails", :group => [:development, :test] #Factory for DB data
gem "shoulda-matchers", :group => :test #Collection of Rails testing matchers
gem 'cucumber-api-steps', :require => false, :group => :test #Cucumber steps for API
gem 'json_spec', group: :test # JSON matchers for tests

source 'https://rubygems.org'

gemspec

gem 'refinerycms', github: 'refinery/refinerycms', branch: '4-0-stable'

group :test, :development do
  gem 'refinerycms-testing', github: 'refinery/refinerycms', branch: '4-0-stable'
end

group :test do
  gem 'poltergeist'
end

# Database Configuration
unless ENV["TRAVIS"]
  gem "activerecord-jdbcsqlite3-adapter", platform: :jruby
  gem 'sqlite3', '~> 1.3', '< 1.4', platform: :ruby
end

if !ENV["TRAVIS"] || ENV["DB"] == "mysql"
  gem "activerecord-jdbcmysql-adapter", platform: :jruby
  gem "jdbc-mysql", "= 5.1.13", platform: :jruby
  gem "mysql2", platform: :ruby
end

if !ENV["TRAVIS"] || ENV["DB"] == "postgresql"
  gem "activerecord-jdbcpostgresql-adapter", platform: :jruby
  gem "pg", platform: :ruby
end

gem "jruby-openssl", platform: :jruby

# Refinery/rails should pull in the proper versions of these
group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

# group :development do
#   gem 'quiet_assets'
# end

group :test do
  gem "launchy"
  gem "byebug"
  gem 'pry'
  gem 'pry-rails'
end

# Load local gems according to Refinery developer preference.
if File.exist? local_gemfile = File.expand_path("../.gemfile", __FILE__)
  eval File.read(local_gemfile)
end

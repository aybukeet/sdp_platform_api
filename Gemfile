ruby "3.4.7"
source "https://rubygems.org"

gem "rails", "~> 8.1.0"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false

# Authentication & Authorization
gem "devise"
gem "devise-jwt"
gem "pundit"

# API
gem "rack-cors"
gem "jsonapi-serializer"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  # Speed up commands on slow machines / big apps
end

group :test do
  gem "shoulda-matchers"
  gem "database_cleaner-active_record"
end
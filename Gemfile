source 'https://rubygems.org'

gem 'rake'
gem 'sinatra', '>= 1.4.0', '< 2.1'
gem 'omniauth-oauth2', '~> 1.3.0' # newer version seem to be incompatible with sentry
gem 'omniauth-google-oauth2'
gem 'mail' # mail address parsing
gem 'rack_csrf'
gem 'erubis'
gem 'sprockets', '~> 3.0' # asset pipeline management
gem 'sprockets-helpers'
gem 'sass'
#gem 'sinatra-asset-pipeline', github: '605data/sinatra-asset-pipeline'
gem 'activerecord', '~> 4.0'
gem 'sinatra-activerecord'
gem 'pg'
# swap out with  github: 'ConsultingMD/activerecord5-redshift-adapter' when we're ready
# to upgrade activerecord to 5.x (desmond depends on 4.2)
gem 'activerecord4-redshift-adapter', github: 'aamine/activerecord4-redshift-adapter'
gem 'coderay' # sql pretty printing

gem 'aws-sdk' # redshift, cloudwatch, s3

gem 'whenever', :require => false # cronjobs

gem 'desmond', git: 'https://github.com/AnalyticsMediaGroup/desmond.git' # sql exporting

gem 'pony' # sending emails

gem 'connection_pool' # for background jobs connections

gem 'activerecord-import'

gem 'tux'
gem 'sql-parser'

group :development do
  gem 'shotgun'
  gem 'puma'
  gem 'capistrano', '~> 3.0', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'ruby-prof'
  gem 'byebug'
end

group :staging, :production do
  gem 'uglifier'
  gem 'passenger'
  gem 'exception_notification' # notification when errors happen
end

group :development, :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'email_spec'
  gem 'coveralls', require: false
end

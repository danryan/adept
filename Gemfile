source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.8'

gem 'pg'
gem 'unicorn'
gem 'dalli'

gem 'haml-rails', '~> 0.3.5'
gem 'cabin'
gem 'fog'
gem 'carrierwave'
gem 'adept-support', github: 'danryan/adept-support'
gem 'mixlib-shellout', require: 'mixlib/shellout'
gem 'libarchive-ruby', require: 'archive'
gem 'acts-as-taggable-on'
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'responders'
gem 'draper'
gem 'devise'
gem 'strong_parameters'
gem 'i18n-js', github: 'fnando/i18n-js', branch: 'rewrite'
gem 'validators'
gem 'six'
gem 'rolify'
gem 'kaminari'
# gem 'rails_admin'
# gem 'rails_admin_tag_list'
# gem 'cancan'
# gem 'cancan_strong_parameters', github: 'colinyoung/cancan_strong_parameters'

# gem 'role_model'
gem 'bitmask_attributes', github: 'joelmoss/bitmask_attributes'
gem 'uuid'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '~> 1.0.3'
  gem 'handlebars_assets'
  # gem 'turbolinks'
  gem 'execjs'
end

gem 'sass-rails', '~> 3.2.3'
gem 'bootstrap-sass', '~> 2.1.0.0'
gem 'compass-rails'
gem 'zurb-foundation'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'select2-rails', '~> 3.2.1'
gem 'underscore-rails'
gem 'jquery-validation-rails', '~> 1.10.0'
gem 'sugar-rails'

group :development do
  gem 'pry-rails'
  gem 'annotate'
  gem 'haml'
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'foreman'
  # gem 'bullet'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'rspec-instafail'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'poltergeist'
  gem 'webmock'
  gem 'email_spec'
  gem 'json_spec'
  gem 'rack-test', require: 'rack/test'
  gem 'spork-rails'
  gem 'database_cleaner', '>= 0.7.2'
  gem 'tach'
  gem 'forgery'
  gem 'timecop'
  gem 'faker'
  gem 'fuubar'
  # gem 'bullet'
end

group :test do
  gem 'cucumber-rails', require: false
  gem "cucumber-rails-training-wheels"
  gem 'fuubar-cucumber'
  gem 'pickle'
  # gem 'ruby-debug19'
end

group :doc do
  gem 'yard'
  gem 'rspec_api_documentation'
end

group :local do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-bundler'
  gem 'guard-annotate'
  gem 'guard-ronn'
  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rails_best_practices', github: 'kugaevsky/guard-rails_best_practices'

  gem 'coolline'
  gem 'simplecov', require: false
  gem 'powder'

  require 'rbconfig'

  if RbConfig::CONFIG['target_os'] =~ /darwin/i
    gem 'rb-fsevent', require: false

    # if `uname`.strip == 'Darwin' && `sw_vers -productVersion`.strip >= '10.8'
      # gem 'terminal-notifier-guard', '~> 1.5.3', require: false
    # else
      gem 'ruby_gntp', require: false
    # end rescue Errno::ENOENT

  elsif RbConfig::CONFIG['target_os'] =~ /linux/i
    gem 'libnotify',  '~> 0.7.1', require: false
    gem 'rb-inotify', require: false

  elsif RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
    gem 'win32console', require: false
    gem 'rb-notifu', '>= 0.0.4', require: false
    gem 'wdm', require: false
  end
end

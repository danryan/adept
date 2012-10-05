require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'capybara/poltergeist'
  require 'capybara/rspec'
  require 'capybara/rails'
  # require 'email_spec'
  require 'json_spec'

  Capybara.default_selector = :css
  Capybara.javascript_driver = :poltergeist
  # Capybara.default_driver = :poltergeist
  
  ActionController::Base.allow_rescue = false

  World(Warden::Test::Helpers)

  # unless [:test, :activerecord, :cache, :file].include?(ActionMailer::Base.delivery_method)
    # ActionMailer::Base.register_observer(EmailSpec::TestObserver)
  # end
  # ActionMailer::Base.perform_deliveries = true

  require 'database_cleaner'
  require 'database_cleaner/cucumber'
  DatabaseCleaner.strategy = :truncation
  Cucumber::Rails::Database.javascript_strategy = :truncation

  Before do
    DatabaseCleaner.start
  end

  After do |scenario|
    DatabaseCleaner.clean
  end
end

Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
end

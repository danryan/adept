require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'capybara/poltergeist'
  # require 'capybara/rspec'
  # require 'capybara/rails'
  require 'email_spec'
  require 'email_spec/cucumber'
  require 'json_spec'

  Capybara.default_selector = :css
  Capybara.javascript_driver = :poltergeist
  # Capybara.default_driver = :poltergeist
  
  ActionController::Base.allow_rescue = false

  World(EmailSpec::Helpers)
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
  World(FactoryGirl::Syntax::Methods)

  require 'factory_girl'
  Dir[Rails.root.join('spec/factories/**/*/rb')].each { |f| require f }

  load "#{Rails.root}/config/routes.rb"
end

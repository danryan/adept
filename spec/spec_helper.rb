require 'rubygems'
require 'spork'

Spork.prefork do
  unless ENV['DRB'] || ENV['CI']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rails'
  require 'capybara/rspec'
  require 'database_cleaner'
  require 'draper/test/rspec_integration'

  Capybara.javascript_driver = :webkit
  WebMock.disable_net_connect!(allow_localhost: true)

  RSpec.configure do |config|
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = true
    config.order = "random"
    config.include FactoryGirl::Syntax::Methods
    config.include Shoulda::Matchers::ActionController
    config.include ActionDispatch::TestProcess
    config.include ControllersHelpers, type: :controller
    config.extend  ControllerMacros, type: :controller
    # config.include Devise::TestHelpers, type: :controller

    config.before(:suite) do
      Fog.mock!
      connection = Fog::Storage.new(provider: 'AWS', aws_access_key_id: "", aws_secret_access_key: "")
      connection.directories.create(key: 'adept-io')
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.after(:suite) do
      Fog.unmock!
    end
  end
end

Spork.each_run do
  # if ENV['DRB']
    # require 'simplecov'
    # SimpleCov.start 'rails'
  # end

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.include ControllersHelpers
  end
end

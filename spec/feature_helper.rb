require 'rubygems'
require 'spork'

Spork.prefork do
  require 'spec_helper'
  require 'email_spec'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'capybara/poltergeist'
end

Spork.each_run do
  Dir[Rails.root.join("spec/features/support/**/*.rb")].each { |f| require f }
end

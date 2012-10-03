require 'rubygems'
require 'spork'
require 'spec_helper'

Spork.prefork do
  require 'email_spec'
end

Spork.each_run do
  Dir[Rails.root.join("spec/features/support/**/*.rb")].each { |f| require f }
end

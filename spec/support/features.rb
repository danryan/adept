require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

module FeatureExampleGroup
  extend ActiveSupport::Concern

  included do
    metadata[:type] = :feature

    before do
      Capybara.javascript_driver = :poltergeist
      Capybara.default_selector = :css
    end

    after do
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end

RSpec.configure do |config|
  config.include FeatureExampleGroup,
    type: :feature,
    example_group: { file_path: config.escaped_path(%w[spec features]) }
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods, type: :feature
  config.include Rails.application.routes.url_helpers, type: :feature
  config.include RSpec::Rails::RequestExampleGroup, type: :feature
  config.include RSpec::Rails::RoutingExampleGroup, type: :feature
  config.include Capybara::RSpecMatchers, type: :feature
end

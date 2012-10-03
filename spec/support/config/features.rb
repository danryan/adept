module FeatureExampleGroup
  extend ActiveSupport::Concern

  included do
    require 'capybara/rspec'
    require 'capybara/rails'
    require 'capybara/poltergeist'

    metadata[:type] = :feature
    # metadata[:js] = true

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
    example_group: { file_path: %r[spec/features] },
    type: :feature,
    capybara_feature: true

  config.include FactoryGirl::Syntax::Methods, type: :feature
  config.include Rails.application.routes.url_helpers, type: :feature
  config.include RSpec::Rails::RequestExampleGroup, type: :feature
  config.include RSpec::Rails::RoutingExampleGroup, type: :feature
  config.include Capybara::RSpecMatchers, type: :feature
end

module FeatureExampleGroup
  extend ActiveSupport::Concern

  included do
    metadata[:type] = :feature
    metadata[:capybara_feature] = true
    
    before do
      Capybara.javascript_driver = :poltergeist
      Capybara.default_selector = :css
    end

    before :js => true do
      Capybara.current_driver = Capybara.javascript_driver
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
    capybara_feature: true,
    example_group: { file_path: config.escaped_path(%w[spec features]) }
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods, type: :feature
  config.include Rails.application.routes.url_helpers, type: :feature
  config.include Capybara::RSpecMatchers, type: :feature
  config.alias_it_should_behave_like_to :step, 'Step:'
end

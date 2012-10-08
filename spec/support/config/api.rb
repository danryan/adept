module APIExampleGroup
  extend ActiveSupport::Concern
  include FactoryGirl::Syntax::Methods
  include Rack::Test::Methods
  include JsonSpec::Helpers
  include Rails.application.routes.url_helpers
  # include Shoulda::Matchers::ActionController
  # include Adept::RSpec::Matchers

  # include RSpec::Rails::RailsExampleGroup
  # include ActionDispatch::Integration::Runner
  # include ActionDispatch::Assertions
  # include RSpec::Rails::Matchers::RedirectTo
  # include RSpec::Rails::Matchers::RenderTemplate
  # include ActionController::TemplateAssertions

  included do
    require 'rack/test'
    require 'json_spec'

    metadata[:type] = :api
    metadata[:api] = true

    before do
      header 'Content-Type', 'application/json'
      header 'Accept', 'application/json'
      # @routes = ::Rails.application.routes
    end

    subject { last_response }

    after do
    end
  end

  def app
    ::Rails.application
  end

end

RSpec.configure do |config|
  config.include APIExampleGroup,
    example_group: { file_path: %r[spec/api] }
end

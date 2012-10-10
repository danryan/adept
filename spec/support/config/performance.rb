module PerformanceExampleGroup
  extend ActiveSupport::Concern
  include RSpec::Rails::RailsExampleGroup
  
  included do
    require 'tach'

    metadata[:type] = :performance
    metadata[:performance] = true

    DatabaseCleaner.strategy = :truncation
  end

end

RSpec.configure do |config|
  config.include PerformanceExampleGroup,
    example_group: { file_path: %r[spec/performance] }
end

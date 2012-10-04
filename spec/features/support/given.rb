module Features
  module Given
    def self.included(base)
      base.instance_eval do
        alias :given :let!
        # alias :given! :let!
      end
    end
  end
end

RSpec.configuration.include Features::Given, :capybara_feature => true

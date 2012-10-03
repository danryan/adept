module Features
  module Given
    def given(name, &block)
      __send__(:let, name, &block)
    end

    def given!(name, &block)
      __send__(:let!, name, &block)
    end
  end
end

RSpec.configure do |config|
  config.extend Features::Given
end
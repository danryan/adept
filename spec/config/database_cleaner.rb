require 'database_cleaner'

RSpec.configure do |config|
  config.before(:each) do
    if defined?(Capybara)
      if Capybara.current_driver == :rack_test
        DatabaseCleaner.strategy = :transaction
      else
        DatabaseCleaner.strategy = :truncation
      end
      # DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.start
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.start
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

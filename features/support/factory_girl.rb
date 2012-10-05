  World(FactoryGirl::Syntax::Methods)

  require 'factory_girl'
  Dir[Rails.root.join('spec/factories/**/*/rb')].each { |f| require f }
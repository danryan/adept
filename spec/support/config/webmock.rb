RSpec.configure do |config|
  config.before do
    WebMock.disable_net_connect!(allow_localhost: true)
  end
end

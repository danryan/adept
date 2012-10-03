RSpec.configure do |config|
  config.before(:all) do
    Fog.mock!
    connection = Fog::Storage.new(provider: 'AWS', aws_access_key_id: "", aws_secret_access_key: "")
    connection.directories.create(key: 'adept-io')
  end

  config.after(:all) do
    Fog.unmock!
  end
end

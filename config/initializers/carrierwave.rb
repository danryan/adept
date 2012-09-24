CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'adept-io'
  # config.fog_host       = 'https://s3.amazonaws.com'
  config.fog_public     = false
  config.fog_attributes = {
    'Cache-Control' => 'max-age=315576000',
    'Content-Type'  => 'application/x-debian-package'
  }
end

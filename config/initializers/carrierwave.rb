CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Adept::Config.aws_access_key_id,
    :aws_secret_access_key  => Adept::Config.aws_secret_access_key,
    :region                 => Adept::Config.aws_region
  }

  config.fog_directory  = Adept::Config.s3_bucket
  # config.fog_host       = 'https://s3.amazonaws.com'
  config.fog_public     = false
  config.fog_attributes = {
    'Cache-Control' => 'max-age=315576000',
    'Content-Type'  => 'application/x-debian-package'
  }
end

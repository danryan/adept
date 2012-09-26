# blatantly stolen with love from https://github.com/heroku/umpire
module Adept
  module Config
    def self.env!(k)
      ENV[k] || raise("missing key #{k}")
    end

    def self.aws_access_key_id; env!("AWS_ACCESS_KEY_ID"); end
    def self.aws_secret_access_key; env!('AWS_SECRET_ACCESS_KEY'); end
    def self.aws_region; ENV['AWS_REGION'] || 'us-east-1'; end
    def self.s3_bucket; env!('ADEPT_S3_BUCKET'); end

    # def self.force_https?; env!("FORCE_HTTPS") == "true"; end
    # def self.api_key; env!("API_KEY"); end
  end
end

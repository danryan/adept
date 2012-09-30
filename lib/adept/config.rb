# blatantly stolen with love from https://github.com/heroku/umpire
module Adept
  module Config

    def self.load_env(file)
      return unless File.exist?(file)
      @entries ||= ::File.read(file).split("\n").inject({}) do |ax, line|
        if line =~ /\A([A-Za-z_0-9]+)=(.*)\z/
          key = $1
          case val = $2
          # Remove single quotes
          when /\A'(.*)'\z/ then ax[key] = $1
            # Remove double quotes and unescape string preserving newline characters
          when /\A"(.*)"\z/ then ax[key] = $1.gsub('\n', "\n").gsub(/\\(.)/, '\1')
          else ax[key] = val
          end
        end
        ax
      end
      @entries.each do |name, value|
        ENV[name] = value
      end
    end

    def self.env!(k)
      load_env(Rails.root + '.env') unless @entries
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
class Repository < ActiveRecord::Base
  include Identifiable
  include Repoable
  # include Authorizable

  VALID_TYPES = %w[ apt yum ]

  resourcify

  belongs_to :user

  has_many :distributions, dependent: :destroy
  has_many :packages, dependent: :destroy

  validates :name,
    presence: true,
    format: { with: /^[A-Za-z\d_]+$/ },
    uniqueness: { scope: [ :user_id, :type ] }

  validates :type,
    presence: true
  #   inclusion: { in: VALID_TYPES }

  def self.compressed_packages(packages)
    out = ""
    packages.each do |package|
      out += package.raw_control.chomp
      out += "\n"
      out += "Filename: #{package.to_path}\n"
      out += "MD5sum: #{package.md5}\n"
      out += "SHA1: #{package.sha1}\n"
      out += "SHA256: #{package.sha256}\n"
      out += "Size: #{package.size}\n"
      out += "\n"
    end
    ActiveSupport::Gzip.compress(out)
  end

  def to_param
    name
  end

  # Stupid Rails and its stupid STI
  # def _type
  # self.type
  # end

  # def _type=(type)
  # self.type = type
  # end

  # def self.inherited(base)
  # super(base)
  # base.class_eval do
  # def self.model_name
  # Repository.model_name
  # end
  # end
  # end
end

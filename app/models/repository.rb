# == Schema Information
#
# Table name: repositories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Repository < ActiveRecord::Base
  attr_accessible :name

  has_many :distributions
  has_many :packages

  validates :name,
    presence: true

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
end

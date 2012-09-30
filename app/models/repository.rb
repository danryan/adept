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
end

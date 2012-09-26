class Repository < ActiveRecord::Base
  attr_accessible :name

  has_many :distributions
  has_many :packages

  validates :name,
    :presence => true
end

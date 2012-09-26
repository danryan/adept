class Repository < ActiveRecord::Base
  attr_accessible :name

  has_many :distributions

  validates :name,
    :presence => true
end

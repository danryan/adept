class DistributionPackage < ActiveRecord::Base
  belongs_to :distribution
  belongs_to :package
  # attr_accessible :title, :body
end

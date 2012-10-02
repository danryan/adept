class Reference < ActiveRecord::Base
  belongs_to :distribution
  belongs_to :package
  # attr_accessible :title, :body
end

# == Schema Information
#
# Table name: references
#
#  id              :integer          not null, primary key
#  distribution_id :integer
#  package_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_references_on_distribution_id  (distribution_id)
#  index_references_on_package_id       (package_id)
#


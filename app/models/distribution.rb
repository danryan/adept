class Distribution < ActiveRecord::Base
  VALID_ARCHS = %w( amd64 i386 source )
  attr_accessible :codename, :description, :label, :origin, :sign_with,
    :component_list, :architecture_list

  belongs_to :repository
  
  has_many :distribution_packages
  has_many :packages, through: :distribution_packages

  acts_as_taggable_on :architectures, :components

  validates :codename, :description, :label, :origin, :architecture_list, :component_list,
    presence: true

  validates :origin,
    format: {
      with: /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}$/,
      message: "is not a valid FQDN"
    }

  validates :codename,
    uniqueness: {
      scope: :repository_id
    }
  validate :validate_architecture_list

  def to_param
    codename
  end

  protected

  def validate_architecture_list
    architecture_list.each do |tag|
      unless VALID_ARCHS.include?(tag)
        errors.add(:architecture_list, "#{tag} is not a recognized architecture")
      end
    end
  end
end

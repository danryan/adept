class Distribution < ActiveRecord::Base
  VALID_ARCHS = %w( amd64 i386 source )
  attr_accessible :codename, :description, :label, :origin, :sign_with, 
    :component_list, :architecture_list

  has_many :references
  has_many :packages, :through => :references

  acts_as_taggable_on :architectures, :components

  validates :codename, :description, :label, :origin,
    :presence => true

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

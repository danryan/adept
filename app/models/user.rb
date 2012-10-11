class User < ActiveRecord::Base
  include Accountable
  include Identifiable
  include Authority::UserAbilities
  include Authorizable

  rolify

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         authentication_keys: [ :login ], 
         email_regexp:  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  attr_accessor :login

  # bitmask :roles, as: [ :user, :admin ]

  has_many :repositories, dependent: :destroy
  
  has_many :apt_repositories, class_name: 'Repository', conditions: { type: 'apt' }
  has_many :yum_repositories, class_name: 'Repository', conditions: { type: 'yum' }

  has_many :packages, through: :repositories
  has_many :distributions, through: :repositories
  
  has_many :user_roles
  has_many :roles, through: :user_roles
  
  before_save :ensure_authentication_token
  # before_create :ensure_default_user_role

  validates :username,
    format: { with: /^[A-Za-z\d_]+$/ }

  validates :name,
    presence: true

  # rails_admin do
    # field :name
    # field :user
  # end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", value: login.downcase]).first
    else
      where(conditions).first
    end
  end

  private

  def ensure_default_user_role
    self.roles << :user unless self.roles.include?(:user)
  end
end

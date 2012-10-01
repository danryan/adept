class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
    authentication_keys: [ :login ]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :email,
    :password, :password_confirmation, :remember_me

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", value: login.downcase]).first
    else
      where(conditions).first
    end
  end
end

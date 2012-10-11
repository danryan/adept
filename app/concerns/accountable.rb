module Accountable
  extend ActiveSupport::Concern

  def is?(role)
    has_role?(role.to_sym)
  end

  def admin?
    has_role?(:admin)
  end

  def user?
    has_role?(:user)
  end
end

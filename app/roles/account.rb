module Account
  def is?(role)
    roles.include?(role.to_sym)
  end 

  def admin?
    is?(:admin)
  end

  def user?
    is?(:user)
  end
end

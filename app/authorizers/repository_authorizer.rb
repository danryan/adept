class RepositoryAuthorizer < ApplicationAuthorizer

  def self.readable_by?(user)
    user.has_role?(:user)
  end

  def self.creatable_by?(user)
    user.has_role?(:user)
  end

  def self.updatable_by?(user)
    user.has_role?(:user)
  end
  
  def self.deletable_by?(user)
    user.has_role?(:user)
  end
  
  def readable_by?(user)
    resource.user_id == user.id || super(user)
  end

  def readable_by?(user)
    resource.user_id == user.id || super(user)
  end

  def updatable_by?(user)
    resource.user_id == user.id || super(user)
  end

  def deletable_by?(user)
    resource.user_id == user.id || super(user)
  end
end

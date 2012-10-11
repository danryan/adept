class RepositoryAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.user? || super(user)
  end

  def self.readable_by?(user)
    user.user?
  end

  def readable_by?(user)
    resource.user_id == user.id #|| super(user)
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

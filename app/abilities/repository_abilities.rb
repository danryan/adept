class RepositoryAbilities
  def self.allowed(user, subject)
    rules = []

    return rules if user.nil?

    if subject.respond_to?(:each)
      rules << :list if subject.all? {|s| s.user_id == user.id || subject.public? || user.admin? }
    else
      rules << :create if user
      rules << :read   if subject.user_id == user.id || subject.public? || user.admin?
      rules << :update if subject.user_id == user.id || user.admin?
      rules << :delete if subject.user_id == user.id || user.admin?
    end

    rules
  end
end

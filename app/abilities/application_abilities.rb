# Other authorizers should subclass this one
class ApplicationAbilities
  def self.allowed(user, application)
    rules = []
    rules << :access_home

    rules
  end
end

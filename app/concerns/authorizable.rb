module Authorizable
  extend ActiveSupport::Concern
  # include Authority::Abilities

  included do
    # self.authorizer_name = "#{self.name}Authorizer"
  end
end
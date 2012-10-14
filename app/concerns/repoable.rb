module Repoable
  extend ActiveSupport::Concern

  included do
    self.inheritance_column = "_something_else"
  end
end
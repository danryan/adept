module Repoable
  extend ActiveSupport::Concern

  included do
    self.inheritance_column = nil
  end
end
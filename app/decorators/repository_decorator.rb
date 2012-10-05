class RepositoryDecorator < Draper::Base
  decorates :repository
  decorates_association :packages
  decorates_association :distributions

  def type
    repository.type.downcase
  end

  def to_json(options={})
    h.current_user.try(:admin?) ? admin_to_json : user_to_json    
  end

  private

  def admin_to_json
    { id: id,
      user_id: user_id,
      name: name,
      type: type,
      created_at: created_at,
      updated_at: updated_at
    }.to_json
  end

  def user_to_json
    {
      name: name,
      type: type,
      created_at: created_at,
      updated_at: updated_at
    }.to_json
  end
  # def as_json(options={})
  #   {
  #     id: id,
  #     name: name,
  #     type: type.downcase,
  #     created_at: created_at,
  #     updated_at: updated_at
  #   }
  # end
end

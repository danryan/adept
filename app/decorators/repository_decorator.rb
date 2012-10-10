class RepositoryDecorator < Draper::Base
  decorates :repository
  decorates_association :packages
  decorates_association :distributions

  def as_json(options={})
    if h.current_user.admin?
      model.as_json(options)
    else
      # options.merge!(only: [ :name, :type, :created_at, :updated_at ])
      model.as_json(options)
    end
  end

  def types
    Repository::VALID_TYPES.map{|t| [t,t]}
  end

  private

  def admin_to_json
    { id: id,
      user_id: user_id,
      name: name,
      type: type,
      created_at: created_at,
      updated_at: updated_at
    }.as_json
  end

  def user_to_json
    {
      name: name,
      type: type,
      created_at: created_at,
      updated_at: updated_at
    }.as_json
  end
end

class ExceptionAppConstraint
  def self.matches?(request)
    request.env["action_dispatch.exception"].present?
  end
end

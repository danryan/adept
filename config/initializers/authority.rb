Authority.configure do |config|

  # USER_METHOD
  # ===========
  # config.user_method = :current_user

  # CONTROLLER_ACTION_MAP
  # =====================
  # For a given controller method, what verb must a user be able to do?
  # For example, a user can access 'show' if they 'can_read' the resource.
  #
  # Defaults are as follows:
  #
  # config.controller_action_map = {
  #   :index   => 'read',
  #   :show    => 'read',
  #   :new     => 'create',
  #   :create  => 'create',
  #   :edit    => 'update',
  #   :update  => 'update',
  #   :destroy => 'delete'
  # }
  config.controller_action_map = {
    :index   => 'read',
    :show    => 'read',
    :new     => 'create',
    :create  => 'create',
    :edit    => 'update',
    :update  => 'update',
    :destroy => 'delete'
  }

  # ABILITIES
  # =========
  # Teach Authority how to understand the verbs and adjectives in your system. Perhaps you
  # need {:microwave => 'microwavable'}. I'm not saying you do, of course. Stop looking at
  # me like that.
  #
  # Defaults are as follows:
  #
  # config.abilities =  {
  #   :create => 'creatable',
  #   :read   => 'readable',
  #   :update => 'updatable',
  #   :delete => 'deletable'
  # }
  config.abilities =  {
    :create => 'creatable',
    :read   => 'readable',
    :update => 'updatable',
    :delete => 'deletable'
  }

  # SECURITY_VIOLATION_HANDLER
  # ==========================
  # If a SecurityViolation is raised, what controller method should be used to rescue it?
  #
  # Default is:
  #
  # config.security_violation_handler = :authority_forbidden # Defined in controller.rb

  # LOGGER
  # ======
  # If a user tries to perform an unauthorized action, where should we log that fact?
  # Provide a logger object which responds to `.warn(message)`, unless your
  # security_violation_handler calls a different method.
  config.logger = Rails.logger
end if defined?(Authority)
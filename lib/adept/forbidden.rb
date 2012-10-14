module Adept
  class Forbidden < StandardError
    attr_reader :object, :action, :subject

    def initialize(object, action, subject)
      @object = object
      @action = action
      @subject = subject
    end

    def message
      "#{@object} is not authorized to #{@action} this resource: #{@subject}"
    end
  end
end
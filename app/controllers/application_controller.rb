require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery
  # TODO: see if commenting this out breaks stuff
  # skip_before_filter :verify_authenticity_token

  responders :flash

  helper_method :abilities, :can?

  before_filter :add_application_abilities

  protected

  def abilities
    @abilities ||= Six.new
  end

  def authorize!(object, action, subject)
    raise Adept::Forbidden.new(object, action, subject) unless can?(object, action, subject)
  end

  def can?(object, action, subject)
    abilities.allowed?(object, action, subject)
  end

  def add_application_abilities
    abilities << ApplicationAbilities
  end

  rescue_from Adept::Forbidden do |exception|
    render "errors/not_found", status: 404
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render "errors/not_found", status: 404
  end
end

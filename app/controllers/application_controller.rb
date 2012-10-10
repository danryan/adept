# require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token

  # responders :flash

  # rescue_from CanCan::AccessDenied do |exception|
    # render :status => 403
  # end

  # rescue_from ActiveRecord::RecordNotFound do |exception|
    # render :status => 404
  # end
end

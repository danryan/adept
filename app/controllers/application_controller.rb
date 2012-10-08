require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  # respond_to :html

  protect_from_forgery
  # responders :flash

  after_filter :add_flash_to_header

  def add_flash_to_header
    return unless request.xhr?

    [ :error, :alert, :notice, :message ].each do |type|
      response.headers["X-Flash-#{type.capitalize}"] = flash[type] unless flash[type].blank?
    end
    # make sure flash does not appear on the next page
    flash.discard
  end
end

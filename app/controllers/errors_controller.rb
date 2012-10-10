class ErrorsController < ApplicationController
  respond_to :html, :json, :xml

  # skip_authorization_check

  def not_found
    respond_to do |format|
      format.html { render 'errors/not_found' }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def forbidden
    respond_to do |format|
      format.html
      format.xml  { head :forbidden }
      format.any  { head :forbidden }
    end
  end

  def unauthorized
    respond_to do |format|
      format.html { render 'errors/not_found' }
      format.xml  { head :unauthorized }
      format.any  { head :unauthorized }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.html { render 'errors/internal_server_error' }
      format.xml  { head :internal_server_error }
      format.any  { head :internal_server_error }
    end
  end
end

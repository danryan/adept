class AptController < ApplicationController
  layout 'apt'
  
  respond_to :html, :json
  respond_to :text, :gz, only: [ :dist_release, :dist_arch_release, :dist_arch_packages ]

  before_filter :repository
  before_filter :authenticate_user!

  def index
    respond_with @repository
  end

  private

  def repository
    @repository ||= Repository.where(name: params[:repo], user_id: current_user.id).first!
  end
end

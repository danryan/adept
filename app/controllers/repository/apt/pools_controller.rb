class Repository::Apt::PoolsController < ApplicationController
  layout 'apt'

  before_filter :repository
  before_filter :authenticate_user!

  def index
    @packages = repository.packages
    respond_with @packages
  end

  def show
    @packages = repository.packages.where(component: params[:id]).select([:component, :prefix]).uniq
    respond_with @packages
  end

  def prefix
    @packages = repository.packages.where("component = :component", component: params[:pool_id]).
      where("prefix = :prefix", prefix: params[:prefix]).
      select([:component, :prefix, :name]).uniq(:name)

    respond_with @packages
  end

  def name
    @packages = repository.packages.where("component = ? AND prefix = ? AND name = ?", *params.values_at(:pool_id, :prefix, :name))
    respond_with @packages
  end

  def package
    @package = repository.packages.where("component = ? AND prefix = ? AND name = ? AND filename = ?", *params.values_at(:pool_id, :prefix, :name, :package)).first
    redirect_to @package.file.url
  end

  private

  def repository
    @repository ||= Repository.where(name: params[:repo], user_id: current_user.id).first!
  end

end

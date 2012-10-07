class Api::V1::PackagesController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!
  before_filter :repository

  def index
    @packages = repository.packages

    respond_with @packages
  end

  def show
    @package = repository.packages.where(name: params[:id]).first!

    respond_with @package
  end

  def create
    @package = repository.packages.new(package_params)
    @package.save

    respond_with @package
  end

  def update
    @package = repository.package.where(name: params[:id]).first!
    @package.update_attributes(package_params)

    respond_with @package
  end

  def destroy
    @package = repository.package.where(name: params[:id]).first!
    @package.destroy

    respond_with @package
  end

  private

  def repository
    @repository ||= current_user.repositories.where(name: params[:repository_id]).first!
  end

  def package_params
    params.require(:package).permit(:file, :component, :distributions, :distribution_ids)
  end
end

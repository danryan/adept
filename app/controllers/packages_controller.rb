class PackagesController < ApplicationController
  respond_to :html, :json

  def index
    @packages = PackageDecorator.all
    respond_with @packages
  end

  def show
    @package = PackageDecorator.find(params[:id])
    respond_with @package
  end

  def new
    @package = Package.new
    respond_with @package
  end

  def create
    @package = Package.new(params[:package])
    @package.save
    respond_with @package
  end

  def edit
    @package = PackageDecorator.find(params[:id])
    respond_with @package
  end

  def update
    @package = Package.find(params[:id])
    @package.update_attributes(params[:package])
    respond_with @package
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    respond_with @package
  end
end

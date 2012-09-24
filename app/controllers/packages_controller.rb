class PackagesController < ApplicationController
  respond_to :html, :json

  def show
    @package = Package.find(params[:id])
    respond_with @package
  end

  def new
    @package = Package.new
    respond_with @package
  end

  def create
    @package = Package.new(params[:package])
    @package.save
    respond_with @package, :location => @package
  end

end

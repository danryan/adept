class AptController < ApplicationController
  respond_to :html, :json

  def index
  end

  def pool

  end

  def component
    @packages = Package.where(:component => params[:component]).select([:component, :letter]).uniq
    respond_with @packages
  end

  def letter
    @packages = Package.where("component = ? AND letter = ?", *params.values_at(:component, :letter)).select([:component, :letter, :name]).uniq(:name)
    respond_with @packages
  end

  def name
    @packages = Package.where("component = ? AND letter = ? AND name = ?", *params.values_at(:component, :letter, :name))
    respond_with @packages
  end

  def package
    @package = Package.where("component = ? AND letter = ? AND name = ? AND original_filename = ?", *params.values_at(:component, :letter, :name, :package)).first
    redirect_to @package.file.url
  end
end

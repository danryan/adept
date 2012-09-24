class RepositoriesController < ApplicationController
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

# get 'apt' => 'repositories#index'
# get 'apt/pool' => 'repositories#pool'
# get 'apt/pool/:component' => 'repositories#component'
# get 'apt/pool/:component/:letter' => 'repositories#letter'
# get 'apt/pool/:component/:letter/:name' => 'repositories#name'
# get 'apt/pool/:component/:letter/:name/:package' => 'repositories#package'

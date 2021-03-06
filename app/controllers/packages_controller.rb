class PackagesController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!
  before_filter :repository

  def index
    @packages = PackageDecorator.decorate(repository.packages.all)

    respond_with repository, @packages
  end

  def show
    package = repository.packages.find(params[:id])
    @package = PackageDecorator.decorate(package)

    respond_with repository, @package
  end

  def new
    @package = repository.packages.new

    respond_with repository, @package
  end

  def create
    @package = repository.packages.new(package_params)
    @package.save

    respond_with repository, @package
  end

  def edit
    package = repository.packages.find(params[:id])
    @package = PackageDecorator.decorate(package)

    respond_with repository, @package
  end

  def update
    @package = repository.packages.find(params[:id])
    @package.update_attributes(package_params)

    respond_with repository, @package
  end

  def destroy
    package = repository.packages.find(params[:id])
    @package = PackageDecorator.decorate(package)
    @package.destroy

    respond_with repository, @package
  end

  private

  def repository
    @repository ||= current_user.repositories.find_by_name!(params[:repository_id])
  end

  def package_params
    params.require(:package).permit(:file, :component, :distributions, :distribution_ids)
  end
end

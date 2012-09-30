class PackagesController < ApplicationController
  respond_to :html, :json

  before_filter :repository

  def index
    @packages = RepositoryDecorator.decorate(repository.packages.all)

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
    @package = repository.packages.new(params[:package])
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
    @package.update_attributes(params[:package])

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
    @repository ||= Repository.find(params[:repository_id])
  end
end

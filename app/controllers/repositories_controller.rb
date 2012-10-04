class RepositoriesController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!

  def index
    repositories = current_user.repositories.all
    @repositories = RepositoryDecorator.decorate(repositories)
    respond_with @repositories
  end

  def show
    repository = current_user.repositories.find(params[:id])
    @repository = RepositoryDecorator.decorate(repository)
    respond_with @repository
  end

  def new
    @repository = current_user.repositories.new
    respond_with @repository
  end

  def create
    @repository = current_user.repositories.new(params[:repository])
    @repository.save
    respond_with @repository
  end

  def edit
    repository = current_user.repositories.find(params[:id])
    @repository = RepositoryDecorator.decorate(repository)
    respond_with @repository
  end

  def update
    @repository = current_user.repositories.find(params[:id])
    @repository.update_attributes(params[:repository])
    respond_with @repository
  end

  def destroy
    @repository = current_user.repositories.find(params[:id])
    @repository.destroy
    respond_with @repository
  end
end

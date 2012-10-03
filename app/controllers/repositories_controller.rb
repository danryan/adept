class RepositoriesController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!

  def index
    @repositories = RepositoryDecorator.all
    respond_with @repositories
  end

  def show
    @repository = RepositoryDecorator.find(params[:id])
    respond_with @repository
  end

  def new
    @repository = Repository.new
    respond_with @repository
  end

  def create
    @repository = Repository.new(params[:repository])
    @repository.save
    respond_with @repository
  end

  def edit
    @repository = RepositoryDecorator.find(params[:id])
    respond_with @repository
  end

  def update
    @repository = Repository.find(params[:id])
    @repository.update_attributes(params[:repository])
    respond_with @repository
  end

  def destroy
    @repository = Repository.find(params[:id])
    @repository.destroy
    respond_with @repository
  end
end

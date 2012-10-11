class RepositoriesController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!

  # authorize_actions_for Repository

  def index
    repositories = current_user.repositories.all
    @repositories = RepositoryDecorator.decorate(repositories)

    @repository = RepositoryDecorator.decorate(current_user.repositories.build)

    authorize_action_for Repository
    respond_with @repositories
  end

  def show
    repository = Repository.find_by_name!(params[:id])
    @repository = RepositoryDecorator.decorate(repository)

    authorize_action_for @repository
    respond_with @repository
  end

  def new
    @repository = RepositoryDecorator.decorate(current_user.repositories.new)

    respond_with @repository
  end

  def create
    @repository = RepositoryDecorator.decorate(current_user.repositories.new(repository_params))
    @repository.save

    respond_with @repository
  end

  def edit
    repository = current_user.repositories.find_by_name!(params[:id])
    @repository = RepositoryDecorator.decorate(repository)

    respond_with @repository
  end

  def update
    @repository = current_user.repositories.find_by_name!(params[:id])
    @repository.update_attributes(repository_params)

    respond_with @repository, location: repository_url(@repository)
  end

  def destroy
    @repository = current_user.repositories.find_by_name!(params[:id])
    @repository.destroy

    respond_with @repository
  end

  private

  def repository_params
    params.require(:repository).permit(:name, :type)
  end
end

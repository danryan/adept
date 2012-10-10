class RepositoriesController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!
  # load_and_authorize_resource :repository, :through => :current_user
  # load_resource :through => :current_user
  # authorize_resource
  # permit_params [ :name, :_type, :user_id ]

  def index
    @repository = RepositoryDecorator.decorate(current_user.repositories.build)
    # authorize! :index, @repositories
    respond_with RepositoryDecorator.decorate(@repositories)
  end

  def show
    respond_with @repository
  end

  def new
    respond_with @repository
  end

  def create
    respond_with @repository
  end

  def edit
    respond_with @repository
  end

  def update
    respond_with @repository
  end

  def destroy
    respond_with @repository
  end

  def repository_params
    params.require(:repository).permit(:name, :_type)
  end
end

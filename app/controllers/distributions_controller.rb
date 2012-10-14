class DistributionsController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!
  before_filter :repository, only: [ :index ]
  before_filter :add_distribution_abilities

  def index
    @distributions = DistributionDecorator.decorate(repository.distributions.all)
    authorize! current_user, :list, @distributions

    respond_with repository, @distributions
  end

  def show
    distribution = Distribution.find_by_codename!(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)
    authorize! current_user, :read, @repository

    respond_with repository, @distribution
  end

  def new
    @distribution = Distribution.new
    authorize! current_user, :create, @repository

    respond_with repository, @distribution
  end

  def create
    @distribution = repository.distributions.new(distribution_params)
    authorize! current_user, :create, @repository
    @distribution.save

    respond_with repository, @distribution # error: "Distribution could not be created."
  end

  def edit
    distribution = repository.distributions.find_by_codename!(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)
    authorize! current_user, :update, @repository

    respond_with repository, @distribution
  end

  def update
    @distribution = repository.distributions.find_by_codename!(params[:id])
    authorize! current_user, :update, @repository
    @distribution.update_attributes(distribution_params)

    respond_with repository, @distribution
  end

  def destroy
    distribution = repository.distributions.find_by_codename!(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)
    authorize! current_user, :delete, @repository
    @distribution.destroy

    respond_with repository, @distribution
  end

  private

  def repository
    @repository ||= Repository.find_by_name!(params[:repository_id])
  end

  def distribution_params
    params.require(:distribution).permit(:codename, :description, :label, :origin, :sign_with, :component_list, :architecture_list)
  end

  def add_distribution_abilities
    abilities.add_pack! :distribution, DistributionAbilities
    abilities.use_pack :distribution
  end
end

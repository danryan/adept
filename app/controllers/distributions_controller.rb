class DistributionsController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!
  before_filter :repository
  # load_and_authorize_resource :through => :repository, :find_by => :codename

  # permit_params distribution: [ :description, :label, :origin,
    # :component_list, :architecture_list ]

  def index
    respond_with repository, @distributions
  end

  def show
    distribution = repository.distributions.find_by_codename!(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with repository, @distribution
  end

  def new
    @distribution = repository.distributions.new

    respond_with repository, @distribution
  end

  def create
    @distribution = repository.distributions.new(distribution_params)
    @distribution.save

    respond_with repository, @distribution # error: "Distribution could not be created."
  end

  def edit
    distribution = repository.distributions.find_by_codename!(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with repository, @distribution
  end

  def update
    @distribution = repository.distributions.find_by_codename!(params[:id])
    @distribution.update_attributes(distribution_params)

    respond_with repository, @distribution
  end

  def destroy
    distribution = repository.distributions.find_by_codename!(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)
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
end

class DistributionsController < ApplicationController
  respond_to :html
  respond_to :json, except: [ :new, :edit ]

  before_filter :authenticate_user!
  before_filter :repository

  def index
    @distributions = RepositoryDecorator.decorate(repository.distributions.all)

    respond_with repository, @distributions
  end

  def show
    distribution = repository.distributions.find(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with repository, @distribution
  end

  def new
    @distribution = repository.distributions.new

    respond_with repository, @distribution
  end

  def create
    @distribution = repository.distributions.new(params[:distribution])
    @distribution.save

    respond_with repository, @distribution # error: "Distribution could not be created."
  end

  def edit
    distribution = repository.distributions.find(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with repository, @distribution
  end

  def update
    @distribution = repository.distributions.find(params[:id])
    @distribution.update_attributes(params[:distribution])

    respond_with repository, @distribution
  end

  def destroy
    distribution = repository.distributions.find(params[:id])
    @distribution = DistributionDecorator.decorate(distribution)
    @distribution.destroy

    respond_with repository, @distribution
  end

  private

  def repository
    @repository ||= Repository.find(params[:repository_id])
  end
end

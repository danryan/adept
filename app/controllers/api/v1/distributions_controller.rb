class Api::V1::DistributionsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!
  before_filter :repository

  def index
    @distributions = repository.distributions

    respond_with @distributions
  end

  def show
    @distribution = repository.distributions.where(name: params[:id]).first!

    respond_with @distribution
  end

  def create
    @distribution = repository.distributions.new(distribution_params)
    @distribution.save

    respond_with @distribution
  end

  def update
    @distribution = repository.distribution.where(name: params[:id]).first!
    @distribution.update_attributes(distribution_params)

    respond_with @distribution
  end

  def destroy
    @distribution = repository.distribution.where(name: params[:id]).first!
    @distribution.destroy

    respond_with @distribution
  end

  private

  def repository
    @repository ||= current_user.repositories.where(name: params[:repository_id]).first!
  end

  def distribution_params
    params.require(:distribution).permit(:codename, :description, :label, :origin, :sign_with, :component_list, :architecture_list)
  end
end

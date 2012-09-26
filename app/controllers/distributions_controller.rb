class DistributionsController < ApplicationController
  respond_to :html, :json

  def index
    @distributions = DistributionDecorator.all
    respond_with @distributions
  end

  def show
    @distribution = DistributionDecorator.find(params[:id])
    respond_with @distribution
  end

  def new
    @distribution = Distribution.new
    respond_with @distribution
  end

  def create
    @distribution = Distribution.new(params[:distribution])
    @distribution.save
    respond_with @distribution
  end

  def edit
    @distribution = DistributionDecorator.find(params[:id])
    respond_with @distribution
  end

  def update
    @distribution = Distribution.find(params[:id])
    @distribution.update_attributes(params[:distribution])
    respond_with @distribution
  end

  def destroy
    @distribution = Distribution.find(params[:id])
    @distribution.destroy
    respond_with @distribution
  end
end

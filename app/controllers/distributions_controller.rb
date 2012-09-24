class DistributionsController < ApplicationController
  respond_to :html, :json

  def new
    @distribution = Distribution.new
  end

  def create
    @distribution = Distribution.new(params[:distribution])
    @distribution.save
    respond_with @distribution
  end
end

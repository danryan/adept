class AptController < ApplicationController
  layout 'apt'

  respond_to :html, :json
  respond_to :text, :gz, only: [ :dist_release, :dist_arch_release, :dist_arch_packages ]

  before_filter :get_repository

  def index
    respond_with @repository
  end

  private

  def get_repository
    repository = Repository.first
    @repository = RepositoryDecorator.decorate(repository)
  end

end

class AptController < ApplicationController
  respond_to :html, :json
  respond_to :text, :only => [ :dist_release, :dist_arch_release ]

  before_filter :get_repository

  # /dist

  def index
    respond_with @repository
  end

  def pool
    @packages = @repository.packages
    respond_with @packages
  end

  def dist
    @distributions = @repository.distributions
    respond_with @distributions
  end

  def codename
    @distribution = @repository.distributions.where("codename = ?", params[:codename]).first
    respond_with @distribution
  end

  def dist_component
    distribution = @repository.distributions.where("codename = ?", params[:codename]).first
    @distribution = DistributionDecorator.decorate(distribution)
    @component = params[:component]
    respond_with @distribution
  end

  def dist_release
    respond_with @release
  end

  def dist_arch
    @codename, @component, @arch = params.values_at(:codename, :component, :arch)
    distribution = @repository.distributions.where("codename = ?", @codename).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  def dist_arch_release
    @codename, @component, @arch = params.values_at(:codename, :component, :arch)
    distribution = @repository.distributions.where("codename = ?", @codename).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  def dist_arch_packages
    @codename, @component, @arch = params.values_at(:codename, :component, :arch)
    distribution = @repository.distributions.where("codename = ?", @codename).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  # /pool

  def component
    @packages = Package.where(:component => params[:component]).select([:component, :letter]).uniq
    respond_with @packages
  end

  def letter
    @packages = Package.where("component = ? AND letter = ?", *params.values_at(:component, :letter)).select([:component, :letter, :name]).uniq(:name)
    respond_with @packages
  end

  def name
    @packages = Package.where("component = ? AND letter = ? AND name = ?", *params.values_at(:component, :letter, :name))
    respond_with @packages
  end

  def package
    @package = Package.where("component = ? AND letter = ? AND name = ? AND original_filename = ?", *params.values_at(:component, :letter, :name, :package)).first
    redirect_to @package.file.url
  end



  def get_repository
    repository = Repository.first
    @repository = RepositoryDecorator.decorate(repository)
  end

end

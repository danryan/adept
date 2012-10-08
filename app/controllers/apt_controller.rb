class AptController < ApplicationController
  layout 'apt'

  respond_to :text, :gz, only: [ :release, :arch_release, :arch_packages ]

  before_filter :authenticate_user!
  before_filter :repository

  def release
    distribution = repository.distributions.where("codename = ?", params[:dist_id]).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  def arch_release
    codename, component, arch = params.values_at(:dist_id, :component, :arch)
    distribution = repository.distributions.where("codename = :codename", codename: codename).first
    origin, label, description = distribution.origin, distribution.description, distribution.label
    @release = Release.new(component, origin, label, arch, description)

    respond_with @release
  end

  def arch_packages
    require 'zlib'
    require 'stringio'

    codename, component, arch = params.values_at(:dist_id, :component, :arch)
    distribution = repository.distributions.find_by_codename(codename)
    # @distribution = DistributionDecorator.decorate(distribution)
    packages = Package.where("component = :component AND architecture = :arch", component: component, arch: arch)
    @packages = PackageDecorator.decorate(packages)

    respond_with @packages do |format|
      format.text
      format.gz do
        send_data Repository.compressed_packages(@packages), content_type: 'application/x-gzip', filename: 'Packages.gz'
      end
    end
  end

  def package
    @package = repository.packages.where("component = ? AND prefix = ? AND name = ? AND filename = ?", *params.values_at(:pool_id, :prefix, :name, :package)).first
    redirect_to @package.file.url
  end

  private

  def repository
    @repository ||= current_user.repositories.where(name: params[:repository_id]).first!
  end
end

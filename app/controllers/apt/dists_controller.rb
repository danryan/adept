class Apt::DistsController < ApplicationController
  # layout :false
  respond_to :text, :gz, only: [ :release, :arch_release, :dist_arch_packages ]

  before_filter :repository

  def index
    @distributions = repository.distributions
    respond_with @distributions
  end

  def show
    distribution = repository.distributions.where("codename = ?", params[:id]).first
    @distribution = DistributionDecorator.decorate(distribution)
    respond_with @distribution
  end

  def release
    distribution = repository.distributions.where("codename = ?", params[:dist_id]).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  def component
    distribution = repository.distributions.where("codename = ?", params[:dist_id]).first
    @distribution = DistributionDecorator.decorate(distribution)
    @component = params[:component]
    respond_with @distribution
  end

  def arch
    @codename, @component, @arch = params.values_at(:dist_id, :component, :arch)
    distribution = repository.distributions.where("codename = :codename", codename: @codename).first
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
    distribution = repository.distributions.where("codename = ?", codename).first
    # @distribution = DistributionDecorator.decorate(distribution)
    packages = Package.where("component = :component AND control -> 'Architecture' = :arch", component: component, arch: arch)
    @packages = PackageDecorator.decorate(packages)

    respond_with @packages do |format|
      format.text
      format.gz do
        send_data compress_packages(@packages), content_type: 'application/x-gzip', filename: 'Packages.gz'
      end
    end
  end
end

private

def repository
  @repository ||= RepositoryDecorator.first
end

def compress_packages(packages)
  out = ""
  @packages.each do |package|
    out += package.raw_control.chomp
    out += <<-EOF
Filename: #{package.to_path}
MD5sum: #{package.md5}
SHA1: #{package.sha1}
SHA256: #{package.sha256}
Size: #{package.size}
EOF
    out += "\n"
    ActiveSupport::Gzip.compress(out)
  end
end

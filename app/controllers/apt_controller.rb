class AptController < ApplicationController
  respond_to :html, :json
  respond_to :text, :gz, :only => [ :dist_release, :dist_arch_release, :dist_arch_packages ]

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
    distribution = @repository.distributions.where("codename = ?", params[:codename]).first
    @distribution = DistributionDecorator.decorate(distribution)
    respond_with @distribution
  end

  def dist_component
    distribution = @repository.distributions.where("codename = ?", params[:codename]).first
    @distribution = DistributionDecorator.decorate(distribution)
    @component = params[:component]
    respond_with @distribution
  end

  def dist_release
    distribution = @repository.distributions.where("codename = ?", params[:codename]).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  def dist_arch
    @codename, @component, @arch = params.values_at(:codename, :component, :arch)
    distribution = @repository.distributions.where("codename = ?", @codename).first
    @distribution = DistributionDecorator.decorate(distribution)

    respond_with @distribution
  end

  def dist_arch_release
    component, arch = params.values_at(:component, :arch)
    dist = @repository.distributions.where("codename = ?", params[:codename]).first
    origin, label, description = dist.origin, dist.description, dist.label
    # @distribution = DistributionDecorator.decorate(distribution)
    @release = Release.new(component, origin, label, arch, description)

    respond_with @release
  end

  def dist_arch_packages
    require 'zlib'
    require 'stringio'

    codename, component, arch = params.values_at(:codename, :component, :arch)
    distribution = @repository.distributions.where("codename = ?", codename).first
    # @distribution = DistributionDecorator.decorate(distribution)
    packages = Package.where("component = :component AND control -> 'Architecture' = :arch", 
        :component => component, :arch => arch)
    @packages = PackageDecorator.decorate(packages)

    respond_with @packages do |format|
      format.text
      format.gz do 
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
        end
        send_data ActiveSupport::Gzip.compress(out), 
          :content_type => 'application/x-gzip',
          :filename => 'Packages.gz'
      end
    end
  end

  # /pool

  def component
    @packages = Package.where(:component => params[:component]).select([:component, :prefix]).uniq
    respond_with @packages
  end

  def prefix
    @packages = Package.where("component = ? AND prefix = ?", *params.values_at(:component, :prefix)).select([:component, :prefix, :name]).uniq(:name)
    respond_with @packages
  end

  def name
    @packages = Package.where("component = ? AND prefix = ? AND name = ?", *params.values_at(:component, :prefix, :name))
    respond_with @packages
  end

  def package
    @package = Package.where("component = ? AND prefix = ? AND name = ? AND filename = ?", *params.values_at(:component, :prefix, :name, :package)).first
    redirect_to @package.file.url
  end

  private

  def get_repository
    repository = Repository.first
    @repository = RepositoryDecorator.decorate(repository)
  end

end

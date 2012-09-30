class DistributionDecorator < Draper::Base
  include Haml::Helpers
  # include Draper::LazyHelpers
  # include Rails.application.routes.url_helpers

  decorates :distribution
  decorates_association :packages
  decorates_association :repository


  def apt_dist_component_link(component)
    h.content_tag :li do
      h.link_to "#{component}/",
        h.apt_dist_component_path(distribution.codename, component)
    end
  end

  def apt_dist_arch_link(component, arch)
    h.content_tag :li do
      h.link_to "binary-#{arch}/",
        h.apt_dist_arch_path(distribution.codename, component, arch)
    end
  end

  def apt_dist_arch_release_link(component, arch)
    h.content_tag :li do
      h.link_to "Release",
        h.apt_dist_arch_release_path(distribution.codename, component, arch)
    end
  end

  def apt_dist_arch_release_gz_link(component, arch)
    h.content_tag :li do
      h.link_to "Release.gz",
        h.apt_dist_arch_release_path(distribution.codename, component, arch, format: :gz)
    end
  end

  def apt_dist_arch_packages_link(component, arch)
    h.content_tag :li do
      h.link_to "Packages",
        h.apt_dist_arch_packages_path(distribution.codename, component, arch)
    end
  end

  def apt_dist_release_link(codename)
    h.content_tag :li do
      h.link_to "Release",
        h.apt_dist_release_path(distribution.codename)
    end
  end
end

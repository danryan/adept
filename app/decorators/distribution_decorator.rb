class DistributionDecorator < Draper::Base
  include Haml::Helpers
  include Draper::LazyHelpers
  include Rails.application.routes.url_helpers

  decorates :distribution
  decorates_association :packages
  decorates_association :repository

  # def url_helpers
  #   Rails.application.routes.url_helpers
  # end

  def apt_dist_arch_link(component, arch)
    content_tag :li do
      link_to "binary-#{arch}/",
        apt_dist_arch_path(distribution.codename, component, arch)
    end
  end

  def apt_dist_arch_release_link(component, arch)
    content_tag :li do
      link_to "Release",
        apt_dist_arch_release_path(distribution.codename, component, arch)
    end
  end

  def apt_dist_arch_packages_link(component, arch)
    content_tag :li do
      link_to "Packages",
        apt_dist_arch_packages_path(distribution.codename, component, arch)
    end
  end
end

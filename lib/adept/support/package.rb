module Adept
  module Support
    class Package
      VCS_FIELDS = [
        :vcs_browser,
        :vcs_arch,
        :vcs_git,
        :vcs_bzr,
        :vcs_cvs,
        :vcs_darcs,
        :vcs_hg,
        :vcs_mtn,
        :vcs_svn
      ]

      DEPENDS_FIELDS = [
        :depends,
        :pre_depends,
        :recommends,
        :suggests,
        :enhances,
        :breaks,
        :conflicts
      ]

      BUILD_FIELDS = [
        :build_depends,
        :build_depends_indep,
        :build_conflicts,
        :build_conflicts_indep,
      ]

      CHECKSUMS_FIELDS = [
        :checksums_sha1,
        :checksums_sha256
      ]

      SOURCE_PACKAGE_GENERAL_FIELDS = [
        :source,
        :maintainer,
        :uploaders,
        :section,
        :priority,
        :standards_version,
        :homepage,
        *VCS_FIELDS,
        *BUILD_FIELDS
      ]

      SOURCE_PACKAGE_BINARY_FIELDS = [
        :package,
        :architecture,
        :section,
        :priority,
        :essential,
        *DEPENDS_FIELDS,
        :description,
        :homepage,
        :built_using
      ]

      CONTROL_FIELDS = [
        :package,
        :source,
        :version,
        :section,
        :priority,
        :architecture,
        :essential,
        *DEPENDS_FIELDS,
        :installed_size,
        :maintainer,
        :description,
        :homepage,
        :built_using,
        :license
      ]

      SOURCE_CONTROL_FIELDS = [
        :format,
        :source,
        :binary,
        :architecture,
        :version,
        :maintainer,
        :uploaders,
        :homepage,
        *VCS_FIELDS,
        :standards_version,
        *BUILD_FIELDS,
        *CHECKSUMS_FIELDS,
        :files
      ]

      CHANGES_FIELDS = [
        :format,
        :date,
        :source,
        :binary,
        :architecture,
        :version,
        :distribution,
        :urgency,
        :maintainer,
        :changed_by,
        :description,
        :closes,
        :changes,
        *CHECKSUMS_FIELDS,
        :files
      ]

      VALID_FIELDS = [
        *VCS_FIELDS,
        *DEPENDS_FIELDS,
        *BUILD_FIELDS,
        *CHECKSUMS_FIELDS,
        *SOURCE_PACKAGE_GENERAL_FIELDS,
        *SOURCE_PACKAGE_BINARY_FIELDS,
        *CONTROL_FIELDS,
        *SOURCE_CONTROL_FIELDS,
        *CHANGES_FIELDS
      ].flatten.compact.uniq
    end
  end
end

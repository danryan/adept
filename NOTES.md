## .adept.yml

# Inspired by TravisCI's .travis.yml

name: libruby1.9.1
version: 1.9.3.194
iteration: 1
architectures:
  - amd64
  - i386
license: MIT
vendor: Example Corp.
maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
priority: optional
section: libs
homepage: http://www.ruby-lang.org/
pre_depends:
  - build-essential
  - libc6 (>= 2.4)
depends:
  - libc6 (>= 2.15)
  - libffi6 (>= 3.0.4)
  - libgdbm3 (>= 1.8.3)
  # ... etc.
replaces:
  - irb1.8
  - libdbm-ruby1.9.1
  - libgdbm-ruby1.9.1
  - libopenssl-ruby1.9.1
  - libreadline-ruby1.9.1
  - rdoc1.8
provides:
  - libdbm-ruby1.9.1
  - libgdbm-ruby1.9.1
  - libopenssl-ruby1.9.1
  - libreadline-ruby1.9.1
conflicts:
  - irb1.8 (<< 1.9.1.378-2~)
  - libdbm-ruby1.9.1
  - libgdbm-ruby1.9.1
  - libopenssl-ruby1.9.1
  - libreadline-ruby1.9.1
  - rdoc1.8 (<< 1.9.1.378-2~)
# If your description is long, you'll want to prepend it with a | .
descrption: | Libraries necessary to run Ruby 1.9.1
 Ruby is the interpreted scripting language for quick and easy
 object-oriented programming.  It has many features to process text
 files and to do system management tasks (as in perl).  It is simple,
 straight-forward, and extensible.
 .
 This package includes the 'libruby-1.9.1' library, necessary to run Ruby 1.9.
require 'spec_helper'

describe Apt::DistsController do
  it do
    should route(:get, '/dan/foo/dists').
      to(action: :index, user: 'dan', repo: 'foo')
  end

  it do
    should route(:get, '/dan/foo/dists/lucid').
      to(action: :show, user: 'dan', repo: 'foo', id: 'lucid')
  end

  it do
    should route(:get, '/dan/foo/dists/lucid/Release').
      to(action: :release, user: 'dan', repo: 'foo', dist_id: 'lucid', format: 'txt')
  end

  it do
    should route(:get, '/dan/foo/dists/lucid/main').
      to(action: :component, user: 'dan', repo: 'foo', dist_id: 'lucid', component: 'main')
  end

  it do
    should route(:get, '/dan/foo/dists/lucid/main/binary-amd64').
      to(action: :arch, user: 'dan', repo: 'foo', dist_id: 'lucid', component: 'main', arch: 'amd64')
  end

  it do
    should route(:get, '/dan/foo/dists/lucid/main/binary-amd64/Release').
      to(action: :arch_release, user: 'dan', repo: 'foo', dist_id: 'lucid', component: 'main', arch: 'amd64', format: 'txt')
  end

  it do
    should route(:get, '/dan/foo/dists/lucid/main/binary-amd64/Packages').
      to(action: :arch_packages, user: 'dan', repo: 'foo', dist_id: 'lucid', component: 'main', arch: 'amd64', format: 'txt')
  end
end

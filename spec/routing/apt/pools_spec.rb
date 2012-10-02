require 'spec_helper'

describe Apt::PoolsController do
  it do
    should route(:get, '/dan/foo/apt/pool').
      to(action: :index, user: 'dan', repo: 'foo')
  end

  it do
    should route(:get, '/dan/foo/apt/pool/main').
      to(action: :show, user: 'dan', repo: 'foo', id: 'main')
  end

  it do
    should route(:get, '/dan/foo/apt/pool/main/r').
      to(action: :prefix, user: 'dan', repo: 'foo', pool_id: 'main', prefix: 'r')
  end

  it do
    should route(:get, '/dan/foo/apt/pool/main/r/ruby1.9.1').
      to(action: :name, user: 'dan', repo: 'foo', pool_id: 'main', prefix: 'r', name: 'ruby1.9.1')
  end

  it do
    should route(:get, '/dan/foo/apt/pool/main/r/ruby1.9.1/libruby1.9.1_1.9.3-194_amd64.deb').
      to(action: :package, user: 'dan', repo: 'foo', pool_id: 'main', prefix: 'r', name: 'ruby1.9.1', package: 'libruby1.9.1_1.9.3-194_amd64.deb')
  end
end

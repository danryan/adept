require 'spec_helper'

describe AptController do
  it "GET /apt/:repository_id/dists/:codename/:component/Release" do
    should route(:get, '/apt/foo/dists/lucid/main/Release').to({
      action: :release, 
      repository_id: 'foo',
      codename: 'lucid',
      component: 'main',
      format: :txt
    })
  end

  it "GET /apt/:repository_id/dists/:codename/:component/binary-:arch/Release" do
    should route(:get, '/apt/foo/dists/lucid/main/binary-amd64/Release').to({
      action: :arch_release, 
      repository_id: 'foo',
      codename: 'lucid',
      component: 'main',
      arch: 'amd64',
      format: :txt
    })
  end

  it "GET /apt/:repository_id/dists/:codename/:component/binary-:arch/Packages" do
    should route(:get, '/apt/foo/dists/lucid/main/binary-amd64/Packages').to({
      action: :arch_packages, 
      repository_id: 'foo',
      codename: 'lucid',
      component: 'main',
      arch: 'amd64',
      format: :txt
    })
  end

  it "GET /apt/:repository_id/dists/:codename/:component/binary-:arch/Packages.gz" do
    should route(:get, '/apt/foo/dists/lucid/main/binary-amd64/Packages.gz').to({
      action: :arch_packages, 
      repository_id: 'foo',
      codename: 'lucid',
      component: 'main',
      arch: 'amd64',
      format: :gz
    })
  end

  it "GET /apt/:repository_id/pool/:prefix/:name/:package" do
    should route(:get, '/apt/foo/pool/r/ruby1.9.1/libruby1.9.1_1.9.3.194-1_amd64.deb').to({
      action: :package, 
      repository_id: 'foo',
      prefix: 'r',
      name: 'ruby1.9.1',
      package: 'libruby1.9.1_1.9.3.194-1_amd64.deb'
    })
  end

  it { should_not route(:get, '/home/foo').to(action: :index, user: 'dan', repo: 'foo') }
  it { should_not route(:get, '/repositories/foo').to(action: :index, user: 'dan', repo: 'foo') }
end


"/apt/:repository_id/dists/:codename/:component/Release(.:format)"
"/apt/:repository_id/dists/:codename/:component/binary-:arch/Release(.:format)"
"/apt/:repository_id/dists/:codename/:component/binary-:arch/Packages(.:format)"
"/apt/:repository_id/pool/:prefix/:name/:package(.:format)"

# arch_release
# arch_packages
# package 
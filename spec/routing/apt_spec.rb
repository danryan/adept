require 'spec_helper'

describe AptController do
  it { should route(:get, '/dan/foo').to(action: :index, user: 'dan', repo: 'foo') }
  it { should_not route(:get, '/home/foo').to(action: :index, user: 'dan', repo: 'foo') }
  it { should_not route(:get, '/repositories/foo').to(action: :index, user: 'dan', repo: 'foo') }
end

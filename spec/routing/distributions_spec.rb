require 'spec_helper'

describe DistributionsController do
  it do
    should route(:get, '/repositories/1/distributions').
      to(action: :index, repository_id: '1')
  end

  it do
    should route(:get, '/repositories/1/distributions/1').
      to(action: :show, repository_id: '1', id: '1')
  end

  it do
    should route(:get, '/repositories/1/distributions/new').
      to(action: :new, repository_id: '1')
  end

  it do
    should route(:post, '/repositories/1/distributions').
      to(action: :create, repository_id: '1')
  end

  it do
    should route(:get, '/repositories/1/distributions/1/edit').
      to(action: :edit, repository_id: '1', id: '1')
  end

  it do
    should route(:put, '/repositories/1/distributions/1').
      to(action: :update, repository_id: '1', id: '1')
  end

  it do
    should route(:delete, '/repositories/1/distributions/1').
      to(action: :destroy, repository_id: '1', id: '1')
  end

end
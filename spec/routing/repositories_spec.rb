require 'spec_helper'

describe RepositoriesController do
  it do
    should route(:get, '/repositories').
      to(controller: 'repositories', action: :index)
  end

  it do
    should route(:get, '/repositories/1').
      to(action: :show, id: '1')
  end

  it do
    should route(:get, '/repositories/new').
      to(action: :new)
  end

  it do
    should route(:post, '/repositories').
      to(action: :create)
  end

  it do
    should route(:get, '/repositories/1/edit').
      to(action: :edit, id: '1')
  end

  it do
    should route(:put, '/repositories/1').
      to(action: :update, id: '1')
  end

  it do
    should route(:delete, '/repositories/1').
      to(action: :destroy, id: '1')
  end

end
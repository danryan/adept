require 'spec_helper'

describe AptController do
  it do
    should route(:get, '/dan/foo/apt').
      to(action: :index, user: 'dan', repo: 'foo')
  end
end

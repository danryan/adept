require 'spec_helper'

describe HomeController do
  it do
    should route(:get, '/').
      to(action: :index)
  end
end
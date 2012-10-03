require 'spec_helper'

describe "Repositories" do
  it "routes to /repositories/new" do
    as_user do
      get '/repositories/new'
      response.body.should include("New Repository")
    end
  end
end

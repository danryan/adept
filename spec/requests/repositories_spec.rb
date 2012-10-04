require 'spec_helper'

describe "Repositories" do
  login!
  
  it "routes to /repositories/new" do
    get '/repositories/new'
    response.body.should include("New Repository")
  end
end

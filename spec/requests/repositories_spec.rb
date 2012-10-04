require 'spec_helper'

describe "Repositories" do
  let!(:user) { create(:confirmed_user) }
  before do
    header 'Content-Type', 'application/json'
    header 'Accept', 'application/json'
    header 'Authorization', "Basic #{Base64.encode64(user.authentication_token)}"
  end

  subject { last_response }

  context 'GET /repositories' do
    before do
      get '/repositories'
    end

    it { should be_ok }
    its(:content_type) { should =~ /application\/json/ }

  end

end

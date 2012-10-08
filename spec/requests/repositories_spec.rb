require 'spec_helper'

describe "Repositories" do
  let!(:user) { create(:user) }
  before do
    header 'Content-Type', 'application/json'
    header 'Accept', 'application/json'
    header 'Authorization', "Basic #{Base64.encode64(user.authentication_token)}"
    header 'User-Agent', 'APT foo blah'
  end

  subject { last_response }

  context 'GET /repositories' do
    before do
      get '/repositories'
    end

    it { should respond_with :ok }
    it { should have_content_type :json }
    it { puts last_request.headers['User-Agent'] }
  end

end

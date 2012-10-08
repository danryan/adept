require 'spec_helper'

describe "/api/v1/repositories" do
  let(:user) { create(:user_with_apt_repository) }
  let(:token) { user.authentication_token }
  let(:repository) { user.repositories.first }
  let(:other_repo) { create(:repository) }

  before do
    header 'Authorization', "Basic #{Base64.encode64(token)}"
  end

  describe 'GET /repositories' do
    before do
      get '/api/v1/repositories'
    end

    it { should respond_with :ok }
    it { should have_content_type :json }
    its(:body) { should be_json_eql user.repositories.to_json }
  end

  describe 'GET /repositories/test' do
    before do
      get '/api/v1/repositories/test'
    end

    it { should respond_with :ok }
    it { should have_content_type :json }
    its(:body) { should be_json_eql repository.to_json }
  end

  describe 'POST /repositories' do
    let(:attributes) { attributes_for(:apt_repository) }
    before do
      post '/api/v1/repositories', { repository: attributes }.to_json
    end

    it { should respond_with :created }
    it { should have_content_type :json }
    its(:body) { should be_json_eql repository.to_json }
  end

  describe 'PUT /repositories/test' do
    let(:repository) { create(:apt_repository, user: user) }

    before do
      put '/api/v1/repositories/test', { repository: { name: 'foo' } }.to_json
    end

    it { should respond_with :no_content }
    it { should_not have_body }
  end

  describe 'DELETE /repositories/test' do
    before do
      delete '/api/v1/repositories/test'
    end

    it { should respond_with :no_content }

    it 'should delete a repository' do
      user.should have(0).repositories
    end
  end

  context 'without authentication' do
    before do
      header 'Authorization', ""
      get '/api/v1/repositories'
    end

    it { should respond_with :unauthorized }
    it { should have_json_error "You need to sign in or sign up before continuing." }
  end

end

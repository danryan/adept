require 'spec_helper'

describe Apt::PoolsController do
  context 'layout' do
    login_user

    let(:user) { create(:user) }
    let(:repository) { create(:repository, user: user) }

    before do
      Repository.stub(:find).and_return(repository)
      get :index, :user => user.username, :repo => repository.name
    end

    it { should render_with_layout('apt') }
  end
end
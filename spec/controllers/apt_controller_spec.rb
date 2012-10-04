require 'spec_helper'

describe AptController do
  login!

  puts example.metadata[:type]
  context 'layout' do
    let(:repository) { create(:repository, user: user) }

    before do
      Repository.stub(:find).and_return(repository)
      get :index, :user => user.username, :repo => repository.name
    end

    it { should render_with_layout('apt') }
  end
end

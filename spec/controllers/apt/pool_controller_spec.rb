require 'spec_helper'

describe Apt::PoolsController do
  context 'layout' do
    let(:repository) { create(:repository) }
    before do
      Repository.stub(:find).and_return(repository)
      get :index
    end

    it { should render_with_layout('apt') }
  end
end

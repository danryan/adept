require 'spec_helper'

describe RepositoriesController do
  def mock_repository(stubs={})
    @mock_repository ||= mock_model(Repository, stubs).as_null_object
  end

  let(:repository) { create(:repository) }

  describe "GET 'index'" do
    before do
      Repository.stub(:all).and_return([repository])
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:repositories).with(RepositoryDecorator.decorate([repository])) }
  end

  describe "GET 'show'" do

    before do
      Repository.stub(:find).and_return(repository)
      get :show, id: repository.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should assign_to(:repository).with(RepositoryDecorator.decorate(repository)) }
  end

  describe "GET 'new'" do
    let(:repository) { Repository.new }

    before do
      Repository.stub(:new).and_return(repository)
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should assign_to(:repository).with(repository) }
  end

  describe "POST 'create'" do
    context 'valid repository' do
      # let(:valid) { attributes_for(:repository).stringify_keys }
      let(:repository) { mock_repository(save: true) }

      before do
        Repository.stub(:new).and_return(repository)
        post :create, repository: {}
      end

      it { should respond_with(:found) }
      it { should redirect_to repository_url(repository) }
      it { should assign_to(:repository).with(repository) }
      it { should set_the_flash.to "Repository was successfully created." }
    end

    context 'invalid distribution' do
      let(:invalid) { attributes_for(:lucid).stringify_keys! }
      let(:distribution) { mock_repository(save: false) }

      before do
        # repository = mock_model(Repository)
        Repository.stub(:find).and_return(repository)
        repository.stub_chain(:distributions, :new).with(invalid).and_return(distribution)
        post :create, repository_id: repository.id, distribution: invalid
      end

      it { should respond_with :ok }
      it { should render_template :new }
      # it { should set_the_flash.to "Distribution could not be created." }
    end

  end

  describe "GET 'edit'" do
    let(:distribution) { create(:lucid, repository: repository) }

    before do
      Repository.stub(:find).and_return(repository)
      repository.stub_chain(:distributions, :find).and_return(distribution)
      get :edit, repository_id: repository.id, id: distribution.id
    end

    it { should respond_with :success }
    it { should render_template :edit }
    it { should assign_to(:repository).with(RepositoryDecorator.decorate(repository)) }
  end

  describe "PUT 'update'" do

    context "valid attributes" do
      let(:distribution) { mock_repository(save: true) }

      before do
        Repository.stub(:find).and_return(repository)
        put :update, id: repository.id, repository: {}
      end

      it { should respond_with :found }
      it { should assign_to :repository }
      it { should set_the_flash.to "Repository was successfully updated."}
    end

    context "invalid attributes" do
      let(:repository) { mock_repository(save: false) }

      before do
        Repository.stub(:find).and_return(repository)
        put :update, id: repository.id, repository: {}
      end

      it { should respond_with :ok }
      it { should render_template :edit }
      it { should assign_to :repository }
      # it { should set_the_flash.to "Distribution was successfully updated." }
    end
  end

  describe "DELETE 'destroy'" do
    let(:distribution) { create(:lucid, repository: repository) }

    before do
      Repository.stub(:find).and_return(repository)
      repository.stub_chain(:distributions, :find).and_return(distribution)
      delete :destroy, repository_id: repository.id, id: distribution.id
    end

    it { should respond_with(:redirect) }
    it { should redirect_to repositories_url }
  end
end

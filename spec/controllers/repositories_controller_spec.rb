require 'spec_helper'

describe RepositoriesController do
  stub_users

  let(:repository) { create(:repository, user: user) }
  let(:new_repository) { build(:repository, user: user) }
  let(:current_user) { controller.current_user }

  before do
    sign_in user
  end

  def mock_repository(stubs={})
    @mock_repository ||= mock_model(Repository, stubs).as_null_object
  end

  describe "GET 'index'" do
    before do
      current_user.stub_chain(:repositories, :all).and_return([repository])
      current_user.stub_chain(:repositories, :build).and_return(new_repository)
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:repositories).with(RepositoryDecorator.decorate([repository])) }
  end

  describe "GET 'show'" do

    before do
      current_user.stub_chain(:repositories, :find_by_name!).and_return(repository)
      get :show, id: repository.name
    end

    context 'authorized' do
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should assign_to(:repository).with(RepositoryDecorator.decorate(repository)) }
    end

    context 'unauthorized access' do
      before do
        current_user.stub_chain(:repositories, :find_by_name!).and_return(repository)
        sign_in unauthorized_user
        get :show, id: repository.name

      end

      it { should respond_with(:not_found) }
    end
  end

  describe "GET 'new'" do
    let(:repository) { RepositoryDecorator.decorate(Repository.new) }

    before do
      current_user.stub_chain(:repositories, :new).and_return(repository)
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should assign_to(:repository).with(repository) }
  end

  describe "POST 'create'" do
    context 'valid repository' do
      let(:repository) { mock_repository(save: true) }

      before do
        current_user.stub_chain(:repositories, :new).and_return(repository)
        post :create, repository: { name: 'foo' }
      end

      it { should redirect_to repository_url(repository) }
      it { should assign_to(:repository).with(repository) }
      it { should set_the_flash.to(/successfully created/) }
    end

    context 'invalid repository' do
      let(:repository) { mock_repository(save: false) }

      before do
        current_user.stub_chain(:repositories, :new).and_return(repository)
        post :create, repository: { name: 'foo' }
      end

      it { should respond_with :ok }
      it { should render_template :new }
      # it 'should set the flash to /could not be updated/' do
      # flash[:alert].should =~ /could not be created/
      # end
    end

  end

  describe "GET 'edit'" do
    before do
      current_user.stub_chain(:repositories, :find_by_name!).and_return(repository)
      get :edit, id: repository.name
    end

    it { should respond_with :success }
    it { should render_template :edit }
    it { should assign_to(:repository).with(RepositoryDecorator.decorate(repository)) }
  end

  describe "PUT 'update'" do
    before do
      current_user.stub_chain(:repositories, :find_by_name!).and_return(repository)
    end

    context "valid attributes" do
      let(:distribution) { mock_repository(save: true) }

      before do
        put :update, id: repository.name, repository: { name: 'foo' }
      end

      it { should respond_with :found }
      it { should assign_to :repository }

      it { should set_the_flash.to(/successfully updated/) }
    end

    context "invalid attributes" do
      let(:repository) { mock_repository(update_attributes: false) }

      before do
        put :update, id: repository.id, repository: { name: 'foo' }
      end

      it { should respond_with :ok }
      it { should render_template :edit }
      it { should assign_to :repository }
      # it 'should set the flash to /could not be updated/' do
      # flash[:alert].should =~ /could not be updated/
      # end
    end
  end

  describe "DELETE 'destroy'" do
    let(:distribution) { create(:lucid, repository: repository) }

    before do
      current_user.stub_chain(:repositories, :find_by_name!).and_return(repository)
      delete :destroy, repository_id: repository.id, id: distribution.id
    end

    it { should respond_with(:redirect) }
    it { should redirect_to repositories_url }
    it { should set_the_flash.to(/successfully destroyed/) }

  end
end

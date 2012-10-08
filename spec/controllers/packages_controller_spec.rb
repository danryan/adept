require 'spec_helper'

describe PackagesController do
  login!

  before do
    CarrierWave::Mount::Mounter.any_instance.stub(:store!)
    CarrierWave::Mount::Mounter.any_instance.stub(:remove!)
    FileUploader.any_instance.stub(:download!)
    Package.any_instance.stub(:store_file!)
    current_user.stub_chain(:repositories, :find_by_name!).and_return(repository)
  end

  def mock_package(stubs={})
    @mock_package ||= mock_model(Package, stubs).as_null_object
  end

  describe "GET 'index'" do
    let(:package) { create(:package, file: file_fixture, repository: repository) }

    before do
      repository.stub_chain(:packages, :all).and_return([package])
      get :index, repository_id: repository.name
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:packages).with([package]) }
    it { should assign_to(:repository).with(repository) }
  end

  describe "GET 'show'" do
    let(:package) { create(:package, file: file_fixture, repository: repository) }

    before do
      repository.stub_chain(:packages, :find).and_return(package)
      get :show, repository_id: repository.name, id: package.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should assign_to(:package).with(PackageDecorator.decorate(package)) }
    it { should assign_to(:repository).with(repository) }
  end

  describe "GET 'new'" do
    let(:package) { repository.packages.new }

    before do
      repository.stub_chain(:packages, :new).and_return(package)
      get :new, repository_id: repository.name
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should assign_to(:package) }
    it { should assign_to(:repository).with(repository) }
  end

  describe "POST 'create'" do
    context 'valid package' do
      let(:package) { mock_package(save: true) }

      before do
        repository.stub_chain(:packages, :new).and_return(package)
        post :create, repository_id: repository.name, package: {}
      end

      it { should respond_with(:found) }
      it { should redirect_to repository_package_url(repository, package) }
      it { should assign_to(:package) }
      it { should assign_to(:repository).with(repository) }
      it { should set_the_flash.to(/successfully created/) }
    end

    context 'invalid package' do
      let(:package) { mock_package(save: false) }

      before do
        Repository.stub(:find_by_name!).and_return(repository)
        repository.stub_chain(:packages, :new).and_return(package)
        post :create, repository_id: repository.name, package: {}
      end

      it { should respond_with :ok }
      it { should render_template :new }
    end

  end

  describe "GET 'edit'" do
    let(:package) { create(:package, file: file_fixture, repository: repository) }

    before do
      repository.stub_chain(:packages, :find).and_return(package)
      get :edit, repository_id: repository.name, id: package.id
    end

    it { should respond_with :success }
    it { should render_template :edit }
    it { should assign_to(:package).with(PackageDecorator.decorate(package)) }
    it { should assign_to(:repository).with(repository) }
  end

  describe "PUT 'update'" do

    context "valid attributes" do
      let(:package) { mock_package(save: true) }

      before do
        repository.stub_chain(:packages, :find).and_return(package)
        put :update, repository_id: repository.name, id: package.id, package: {}
      end

      it { should respond_with(:found) }
      it { should redirect_to repository_package_url(repository, package) }
      it { should assign_to(:package).with(package) }
      it { should assign_to(:repository).with(repository) }
      it { should set_the_flash.to(/successfully updated/) }
    end

    context "invalid attributes" do
      let(:package) { mock_package(save: false) }

      before do
        repository.stub_chain(:packages, :find).and_return(package)
        put :update, repository_id: repository.name, id: package.id, package: {}
      end

      it { should respond_with :ok }
      it { should render_template :edit }
      it { should assign_to :package }
      it { should assign_to(:repository).with(repository) }
    end
  end

  describe "DELETE 'destroy'" do
    let(:package) { create(:package, file: file_fixture, repository: repository) }

    before do
      repository.stub_chain(:packages, :find).and_return(package)
      delete :destroy, repository_id: repository.name, id: package.id
    end

    it { should respond_with(:redirect) }
    it { should redirect_to repository_packages_url(repository) }
  end
end

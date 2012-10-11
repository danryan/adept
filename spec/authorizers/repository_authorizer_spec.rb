require 'spec_helper'

describe RepositoryAuthorizer do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:other) { create(:user) }

  describe "user authorization" do
    let(:repository_resource) { build_stubbed(:apt_repository, user: user) }

    subject(:resource) { repository_resource }

    it "should allow admins to perform all actions" do
      Repository.should be_creatable_by(admin)
      resource.should be_readable_by(admin)
      resource.should be_updatable_by(admin)
      resource.should be_deletable_by(admin)
    end

    it "should allow any user to create a repository" do
      Repository.should be_creatable_by(user)
      Repository.should be_creatable_by(other)
    end

    it "should allow the repository owner to perform all actions" do
      resource.should be_readable_by(user)
      resource.should be_updatable_by(user)
      resource.should be_deletable_by(user)
    end

    it "should not allow another user to perform any actions" do
      resource.should_not be_readable_by(other)
      resource.should_not be_updatable_by(other)
      resource.should_not be_deletable_by(other)
    end
  end
end

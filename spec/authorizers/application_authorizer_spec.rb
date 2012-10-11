require 'spec_helper'

describe ApplicationAuthorizer do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe "class" do
    it "should allow admins to perform all actions" do
      ApplicationAuthorizer.should be_creatable_by(admin)
      ApplicationAuthorizer.should be_readable_by(admin)
      ApplicationAuthorizer.should be_updatable_by(admin)
      ApplicationAuthorizer.should be_deletable_by(admin)
    end

    it "should not allow users to perform any actions" do
      ApplicationAuthorizer.should_not be_creatable_by(user)
      ApplicationAuthorizer.should_not be_readable_by(user)
      ApplicationAuthorizer.should_not be_updatable_by(user)
      ApplicationAuthorizer.should_not be_deletable_by(user)
    end
  end
end

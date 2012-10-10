require 'spec_helper'

describe "Using bitmasks for user roles" do
  before do
    10_000.times do
      FactoryGirl.create(:random_user)
    end
    10_000.times do
      FactoryGirl.create(:random_admin)
    end
  end

  example do
    Tach.meter(1) do
      tach('finding users with user role') do
        User.with_roles(:user)
      end

      tach('finding users with admin role') do
        User.with_roles(:admin)
      end
    end
  end


end

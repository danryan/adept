include Devise::TestHelpers
include Warden::Test::Helpers

def as_user(user=nil, &block)
  current_user = user || FactoryGirl.create(:user)
  if request.present?
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in(current_user)
  else
    login_as(current_user, scope: :user)
  end
  block.call if block.present?
  return self
end

def as_visitor(user=nil, &block)
  current_user = user || FactoryGirl.stub(:user)
  if request.present?
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_out(current_user)
  else
    logout(:user)
  end
  block.call if block.present?
  return self
end

def login_user
  let(:user) { create(:user) }
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
  end
end

def stub_login
  allow_message_expectations_on_nil
  user = double('user')
  request.env['warden'].stub(:authenticate! => user)
  controller.stub(:current_user => user)
end

def stub_visitor
  allow_message_expectations_on_nil
  
end

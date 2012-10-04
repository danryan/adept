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

# def sign_in(user = double('user'))
#   if user.nil?
#     request.env['warden'].stub(:authenticate!).
#       and_throw(:warden, {:scope => :user})
#     controller.stub :current_user => nil
#   else
#     request.env['warden'].stub :authenticate! => user
#     controller.stub :current_user => user
#   end
# end

def login_user
  let!(:user) { create(:user) }
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
    controller.stub :current_user => user
  end
  # let(:current_user) { current_user }
end

def stub_login
  let!(:user) { create(:user) }
  before(:each) do
    user.confirm!
    # if request.present?
      # request.env["devise.mapping"] = Devise.mappings[:user]
    # end
    controller.stub(:current_user => user)
  end

  # user.confirm!
  # user = double('user')
end

def stub_visitor
  allow_message_expectations_on_nil

end

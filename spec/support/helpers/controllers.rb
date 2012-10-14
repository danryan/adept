module ControllerHelpers
  def sign_in(user = create(:user))
    allow_message_expectations_on_nil
    if user.nil?
      request.env['warden'].stub(:authenticate!).
        and_throw(:warden, {:scope => :user})
      controller.stub :current_user => nil
    else
      request.env['warden'].stub :authenticate! => user
      controller.stub :current_user => user
    end
  end
end

module ControllerMacros
  def stub_users
    let(:user) { create(:user) }
    let(:unauthorized_user) { create(:user) }
  end
  
  def login!(options={})
    let(:user) { create(:user) }

    before(:each) { sign_in user }

    let(:repository) { create(:repository, user: user) }
    let(:current_user) { controller.current_user }
  end

  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  # def login_user
  #   let(:user) { create(:user) }
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
  #     sign_in user
  #   end
  # end
end

RSpec.configure do |config|
  config.include ControllerHelpers, type: :controller
  config.extend  ControllerMacros, type: :controller
  config.include ControllerHelpers, type: :request
  config.extend  ControllerMacros, type: :request
end

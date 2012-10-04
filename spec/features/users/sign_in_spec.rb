require 'feature_helper'

feature "sign in" do
  puts example.metadata[:type]
  context "as a valid user" do
      puts example.metadata[:type]

    given(:user) { create(:confirmed_user) }

    background do
      sign_in(user.username, user.password)
    end

    scenario "can sign in successfully" do
      page.should have_content 'Signed in successfully.'
    end
  end

  context "as an invalid user" do
    given(:user) { build(:user) }

    background do
      sign_in(user.username, user.password)
    end

    scenario "cannot sign in" do
      page.should have_content 'Invalid login or password.'
    end
  end
end


# feature "sign in" do
#   given(:user) { create(:confirmed_user) }

#   scenario "is a valid user" do

#   end

#   scenario "is an invalid user" do

#     page.should have_content('Invalid login or password.')
#   end

#   describe "unconfirmed user" do
#     given(:user) { create(:user) }

#     scenario "can't log in if not confirmed" do

#     end
#   end
# end

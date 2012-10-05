# module Features
#   module Authentication
#     include Rack::Test::Methods
#     include Warden::Test::Helpers
#     include Spinach::DSL

#     def sign_in(name, password)
#       visit '/sign_in'
#       within '#new_user' do
#         fill_in 'Login', with: name
#         fill_in 'Password', with: password
#       end
#       click_button 'Sign in'
#     end

#     step 'is not authenticated' do
#       delete sign_out_path
#     end

#     step 'is authenticated' do
#       sign_in(@user.username, @user.password)
#     end

#     step 'he clicks "Sign out"' do
#       click_link 'settings-dropdown'
#       click_link 'Sign out'
#     end

#     step 'he should see "Signed out successfully."' do
#       page.should have_content "Signed out successfully."
#     end
#   end
# end

# Spinach::FeatureSteps.send :include, Features::Authentication

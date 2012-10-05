# module Features
#   module Registration
#     include Spinach::DSL

#     def sign_up(username, email, password, password_confirmation)
#       visit '/sign_up'
#       within '#new_user' do
#         fill_in 'Username', with: username
#         fill_in 'Email', with: email
#         fill_in 'Password', with: password
#         fill_in 'Password confirmation', with: password_confirmation
#       end
#       click_button 'Sign up'
#     end

#     step 'the user "danryan" has not signed up' do
#       @user = build(:user)
#     end

#     step 'a user exists' do
#       @user = create(:user)
#       @user.confirm!
#     end

#     step 'he signs up' do
#       sign_up(@user.username, @user.email, @user.password, @user.password_confirmation)
#     end

#     step 'is confirmed' do
#       @user.confirm!
#     end

#     step 'is not confirmed' do
#       @user.update_attribute(:confirmed_at, nil)
#     end
    
#   end
# end

# Spinach::FeatureSteps.send :include, Features::Registration

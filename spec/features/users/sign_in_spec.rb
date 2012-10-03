require 'spec_helper'

feature "signing in" do
  
  # background do
    let(:user) { create(:user) }
  # end

  scenario "is a valid user" do
    visit sign_in_path
    within('#new_user') do
      fill_in 'Login', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
    page.should have_content('Signed in successfully.')
  end

  scenario "is an invalid user" do
    visit sign_in_path
    within('#new_user') do
      fill_in 'Login', with: 'dan'
      fill_in 'Password', with: 'qwerty'
      click_button 'Sign in'
    end
    page.should have_content('Invalid login or password.')
  end
end

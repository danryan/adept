module Features
  module Authentication

    def sign_in(username, password)
      visit sign_in_path

      within('#new_user') do
        fill_in 'Login', :with => username
        fill_in 'Password', :with => password
      end
      click_button 'Sign in'
    end
  end
end

RSpec.configure do |config|
  config.include Features::Authentication, type: :feature
end
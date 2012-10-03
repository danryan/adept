module Features
  module Authentication

    def sign_in
      puts Capybara.current_driver
      visit sign_in_path

      within('#new_user') do
        fill_in 'Login', :with => 'dan'
        fill_in 'Password', :with => 'qwerty'
      end
      click_button 'Sign in'
    end
  end
end

RSpec.configure do |config|
  config.include Features::Authentication, type: :feature
end
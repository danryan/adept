module Features
  module Authentication
    include Rack::Test::Methods

    def sign_in(name, password)
      visit '/sign_in'
      within '#new_user' do
        fill_in 'Login', with: name
        fill_in 'Password', with: password
      end
      click_button 'Sign in'
    end
  end
end

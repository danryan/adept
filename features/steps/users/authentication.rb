class Authentication < Spinach::FeatureSteps
  include Rack::Test::Methods

  Given 'a user has signed up' do
    @user = create(:user)
  end

  And 'is not authenticated' do
    delete('/sign_out')
  end

  When 'he signs in' do
    visit sign_in_path
  end

  Then 'he should see "Signed in successfully."' do
    pending 'step not implemented'
  end

  When 'he signs in with bad credentials' do
    pending 'step not implemented'
  end

  Then 'I should see "Invalid login or password."' do
    pending 'step not implemented'
  end

  Given 'a user has not signed up' do
    pending 'step not implemented'
  end

  Then 'he should see "Invalid login or password."' do
    pending 'step not implemented'
  end

  And 'is not confirmed' do
    pending 'step not implemented'
  end

  Then 'he should see "You have to confirm your account before continuing."' do
    pending 'step not implemented'
  end

  But 'is confirmed' do
    pending 'step not implemented'
  end

  private

  def sign_in(name, password)
    visit '/sign_in'
    within '#new_user' do
      fill_in 'Login', with: name
      fill_in 'Password', with: password
    end
    click_button 'Sign in'
  end
end

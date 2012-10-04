class SignInAsConfirmedUser < Spinach::FeatureSteps
  include Features::Authentication

  Given 'a user has signed up' do
    @user = create(:user)
    @user.confirm!
  end

  And 'is not authenticated' do
    delete sign_out_path
  end

  But 'is confirmed' do
    @user.confirm!
  end

  When 'he signs in' do
    sign_in @user.username, @user.password
  end

  Then 'he should see "Signed in successfully."' do
    page.should have_content "Signed in successfully."
  end
end

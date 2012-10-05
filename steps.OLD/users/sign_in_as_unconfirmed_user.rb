class SignInAsUnconfirmedUser < Spinach::FeatureSteps
  step 'a new, unconfirmed user' do
    @user = create(:user)
  end

  step 'he signs in' do
    sign_in(@user.username, @user.password)
  end

  step 'he should see "You have to confirm your account before continuing."' do
    page.should have_content "You have to confirm your account before continuing."
  end
end

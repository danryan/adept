class SignInAsConfirmedUser < Spinach::FeatureSteps
  step 'a user has signed up' do
    @user = create(:user)
  end

  step 'he signs in' do
    sign_in @user.username, @user.password
  end

  step 'he should see "Signed in successfully."' do
    page.should have_content "Signed in successfully."
  end
end

class SignInWithInvalidCredentials < Spinach::FeatureSteps
  step 'a user has signed up' do
    @user = create(:user)
    @user.confirm!
  end

  step 'is not authenticated' do
    delete sign_out_path
  end

  step 'he signs in with bad credentials' do
    sign_in(@user.username, "BAD PASSWORD")
  end

  step 'he should see "Invalid login or password."' do
    page.should have_content "Invalid login or password."
  end
end

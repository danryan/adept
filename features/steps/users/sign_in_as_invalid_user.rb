class SignInAsInvalidUser < Spinach::FeatureSteps
  step 'a user has not signed up' do
    @user = build(:user)
  end

  step 'he signs in' do
    sign_in @user.username, @user.password
  end

  step 'he should see "Invalid login or password."' do
    page.should have_content "Invalid login or password."
  end
end

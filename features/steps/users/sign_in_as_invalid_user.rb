class SignInAsInvalidUser < Spinach::FeatureSteps
  include Features::Authentication

  Given 'a user has not signed up' do
    @user = build(:user)
  end

  When 'he signs in' do
    sign_in @user.username, @user.password
  end

  Then 'he should see "Invalid login or password."' do
    page.should have_content "Invalid login or password."
  end
end

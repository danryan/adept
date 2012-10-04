class SignInWithInvalidCredentials < Spinach::FeatureSteps
  include Features::Authentication

  Given 'a user has signed up' do
    @user = create(:user)
    @user.confirm!
  end

  And 'is not authenticated' do
    delete sign_out_path
  end

  When 'he signs in with bad credentials' do
    sign_in(@user.username, "BAD PASSWORD")
  end

  Then 'he should see "Invalid login or password."' do
    page.should have_content "Invalid login or password."
  end
end

class AccountConfirmation < Spinach::FeatureSteps
  step 'he confirms his account via the confirmation link' do
    open_email "dan@appliedawesome.com"
    visit_in_email 'Confirm my account'
  end

  step 'he should be confirmed' do
    @user = User.find_by_email("dan@appliedawesome.com")
    @user.should be_confirmed
    page.should have_content "Your account was successfully confirmed"
  end
end

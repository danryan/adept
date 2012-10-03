class Registration < Spinach::FeatureSteps


  Given 'the user "danryan" has not signed up' do
    @user = build(:danryan)
  end

  When 'he signs up' do
    sign_up(@user.username, @user.email, @user.password, @user.password_confirmation)
  end

  Then 'he should see "a confirmation link has been sent"' do
    page.should have_content "a confirmation link has been sent"
  end

  And '"dan@appliedawesome.com" receives an email' do
    unread_emails_for(@user.email).size.should >= parse_email_count(1)
    open_last_email_for(last_email_address)
    current_email.should have_subject 'Confirmation instructions'
    current_email.should have_content 'Welcome dan@appliedawesome.com!'
    # email_should_have_subject('Confirmation instructions')
  end

  And 'he confirms his account via the confirmation link' do
    open_email "dan@appliedawesome.com"
    visit_in_email 'Confirm my account'
  end

  Then 'he should be confirmed' do
    @user = User.find_by_email("dan@appliedawesome.com")
    @user.confirmed?.should be_true
    page.should have_content "Your account was successfully confirmed"
  end
 
  private

  def sign_up(username, email, password, password_confirmation)
    visit '/sign_up'
    within '#new_user' do
      fill_in 'Username', with: username
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
    end
    click_button 'Sign up'
  end
end

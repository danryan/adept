require 'feature_helper'

feature "registering a new account" do
  given(:user) { build(:user) }

  background do
    sign_up(user.username, user.email, user.password, user.password_confirmation)
  end

  scenario "receives the confirmation email" do
    page.should have_content "a confirmation link has been sent"
    unread_emails_for(user.email).size.should >= parse_email_count(1)
    open_last_email_for(last_email_address)
    current_email.should have_subject 'Confirmation instructions'
    current_email.should have_content 'Welcome dan@appliedawesome.com!'
  end
end

feature "confirming a new account" do
  given(:user) { build(:user) }

  background do
    sign_up(user.username, user.email, user.password, user.password_confirmation)
  end

  scenario "clicks the confirmation link in the email" do
    unread_emails_for(user.email).size.should >= parse_email_count(1)

    open_email "dan@appliedawesome.com"
    visit_in_email 'Confirm my account'
    new_user = User.find_by_email(user.email)
    # new_user.should be_confirmed
    page.should have_content "Your account was successfully confirmed"
  end
end

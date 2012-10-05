class AccountRegistration < Spinach::FeatureSteps
  step 'he should see "a confirmation link has been sent"' do
    page.should have_content "a confirmation link has been sent"
  end

  step '"dan@appliedawesome.com" receives an email' do
    unread_emails_for(@user.email).size.should >= parse_email_count(1)
    open_last_email_for(last_email_address)
    current_email.should have_subject 'Confirmation instructions'
    current_email.should have_content 'Welcome dan@appliedawesome.com!'
  end
end

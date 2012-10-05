def create_visitor
  @visitor ||= attributes_for(:user)
end

def find_user
  @user ||= User.where(email: @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = create(:user, email: @visitor[:email])
end

def delete_user
  @user ||= User.where(email: @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/sign_up'
  fill_in 'Username', with: @visitor[:username]
  fill_in 'Email', with: @visitor[:email]
  fill_in 'Password', with: @visitor[:password]
  fill_in 'Password confirmation', with: @visitor[:password_confirmation]
  click_button 'Sign up'
  find_user
end

def sign_in_with(attribute)
  login = attribute == :email ? @visitor[:email] : @visitor[:username]

  visit '/sign_in'
  fill_in 'Login', with: login
  fill_in 'Password', with: @visitor[:password]
  click_button 'Sign in'
end

def sign_in
  sign_in_with(:email)
end

def sign_out
  visit '/sign_out'
end

## Given

Given /^I am not signed in$/ do
  sign_out
end

Given /^I am signed in$/ do
  create_user
  sign_in
end

Given /^I am a registered user$/ do
  create_user
end

Given /^I am an unregistered user$/ do
  create_visitor
  delete_user
end

Given /^I am an unconfirmed user$/ do
  create_unconfirmed_user
end

## When

When /^I sign in with valid data$/ do
  create_visitor
  sign_in
end

When /^I sign up with valid data$/ do
  create_visitor
  sign_up
  find_user
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(email: "notanemail")
  sign_up
end

When /^I sign up with an invalid username$/ do
  create_visitor
  @visitor = @visitor.merge(username: "asdf***")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(password: nil)
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(email: "wrong@example.com")
  sign_in_with(:email)
end

When /^I sign in with a wrong username$/ do
  @visitor = @visitor.merge(username: "asdfddsfsdf")
  sign_in_with(:username)
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(password: "wrongpass")
  sign_in
end

# When /^I (?:visit|go to) the sign up page$/ do
  # visit '/sign_up'
# end

# When /^I (?:visit|go to) the sign in page$/ do
  # visit '/sign_in'
# end


## Then

Then /^I should be signed in$/ do
  page.should have_content "Sign out"
  page.should have_content "Edit profile"
  page.should_not have_content "Sign up"
  page.should_not have_content "Sign in"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end

Then /^I should see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I should see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I should see a confirmation request message$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address."
end

Then /^I should see an unsuccessful sign in message$/ do
  page.should have_content "You are already signed in."
end

Then /^I should see an unsuccessful sign up message$/ do
  page.should have_content "You are already signed in."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "is invalid"
end

Then /^I should see an invalid username message$/ do
  page.should have_content "is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I should see an invalid login message$/ do
  page.should have_content "Invalid login or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should be confirmed$/ do
  create_visitor
  find_user
  @user.should be_confirmed
end

Then /^I should not be confirmed$/ do
  @user.should_not be_confirmed
end


When /^I confirm my account via the confirmation link$/ do
  open_email @user.email
  visit_in_email 'Confirm my account'
end

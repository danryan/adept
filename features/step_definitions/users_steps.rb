Given /ha(?:s|ve) signed up$/ do
  @user = create(:user)
end

Given /ha(?:s|ve) not signed up$/ do
  @user = build(:user)
end

Given /is (not)*\s?authenticated$/ do |val|
  val == "not" ? delete('/sign_out') : login(@user.username, @user.password)
end

When /signs? in$/ do
  sign_in(@user.username, @user.password)
end

When /signs? up$/ do
  sign_up(@user.username, @user.email, @user.password, @user.password_confirmation)
end

When /signs? in with bad credentials$/ do
  sign_in(@user.username, "BADPASSWORD")
end

Given /is not confirmed$/ do
  @user.confirmed_at = nil
  @user.save
end

Given /is confirmed$/ do
  @user.confirm!
end

Given /^the "(.*?)" user exists:$/ do |username|
  @user = create(:user, :username => username )
end

module AuthenticationSteps
  def sign_in(name, password)
    visit '/sign_in'
    within '#new_user' do
      fill_in 'Login', with: name
      fill_in 'Password', with: password
    end
    click_button 'Sign in'
  end

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

World(AuthenticationSteps)

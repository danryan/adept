# Given

Given /^I have no repositories$/ do
  @user.repositories.destroy_all
end

# When

When /^I create a new (.*?) repository named "(.*?)"$/ do |type, name|
  fill_in 'Name', with: name
  select type.capitalize, from: 'repository_type'
  click_button 'Create Repository'
end

# Then

Then /^I should see a successful repository create message$/ do
  page.should have_content "Repository was successfully created."
end

Then /^I should see my repository "(.*?)"$/ do |name|
  page.should have_content name
end
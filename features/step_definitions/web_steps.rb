Then /^I should see "(.*?)"$/ do |content|
  page.should have_content content
end
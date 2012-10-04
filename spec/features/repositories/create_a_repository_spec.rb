require 'spec_helper'

feature "creating a repository" do
  # scenario "as an authenticated user" do
  #   as_user do
  #     visit '/repositories/new'
  #     fill_in 'Name', with: 'test'
  #     click_button 'Create Repository'
  #     page.should have_content('successfully created') 
  #   end
  # end

  scenario "as an unauthenticated user" do
    as_visitor do
      visit '/repositories/new'
      page.should have_content("sign in or sign up before continuing")
    end
  end
end

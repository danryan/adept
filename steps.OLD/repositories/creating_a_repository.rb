class CreatingARepository < Spinach::FeatureSteps
  step 'no repositories exist' do
    @user.should have(0).repositories
  end

  step 'he visits the new repositories page' do
    visit new_repository_path
  end

  step 'he creates a new repository named "testrepo"' do
    within '#new_repository' do
      fill_in 'Name', with: 'testrepo'
    end
    click_button 'Create Repository'
  end

  step 'he should see "testrepo"' do
    page.should have_content 'Repository was successfully created.'
    page.should have_content 'testrepo'
  end
end

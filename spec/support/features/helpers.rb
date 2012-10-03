module FeatureHelpers
  # def render
    # page.driver.render('tmp/screenshot.png')
    # system("open tmp/screenshot.png")
  # end

  shared_examples_for 'sign up' do
    visit ''
  end
end

RSpec.configure { |c| c.include FeatureHelpers, :type => :request }
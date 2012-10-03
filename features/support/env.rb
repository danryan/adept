ENV['RAILS_ENV'] = 'test'
require_relative '../../config/environment'
require 'spinach-rails'

require 'rspec'
require 'capybara/rspec'
require 'capybara/rails'
require 'spinach/capybara'
require 'email_spec'
require 'database_cleaner'

include FactoryGirl::Syntax::Methods
include EmailSpec::Helpers
include EmailSpec::Matchers
include Warden::Test::Helpers


if defined?(ActionMailer)
  unless [:test, :activerecord, :cache, :file].include?(ActionMailer::Base.delivery_method)
    ActionMailer::Base.register_observer(EmailSpec::TestObserver)
  end
  ActionMailer::Base.perform_deliveries = true

  Spinach.hooks.before_scenario do
    # Scenario setup
    case ActionMailer::Base.delivery_method
      when :test then ActionMailer::Base.deliveries.clear
      when :cache then ActionMailer::Base.clear_cache
    end
  end
end

Spinach.hooks.after_scenario do
  EmailSpec::EmailViewer.save_and_open_all_raw_emails if ENV['SHOW_EMAILS']
  EmailSpec::EmailViewer.save_and_open_all_html_emails if ENV['SHOW_HTML_EMAILS']
  EmailSpec::EmailViewer.save_and_open_all_text_emails if ENV['SHOW_TEXT_EMAILS']
end

# include Rack::Test::Methods

DatabaseCleaner.strategy = :truncation
Spinach.hooks.before_scenario do
  DatabaseCleaner.clean
end

::Capybara.javascript_driver = :poltergeist

#
# Spinach.config.save_and_open_page_on_failure = true

module App
  def app
    @app ||= Rails.application
  end

end

Spinach::FeatureSteps.include App
if ENV['DRB'] and not ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter "/.bundle/"
    add_group "Uploaders", "app/uploaders"
    add_group "Decorators", "app/decorators"
  end
end
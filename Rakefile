#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Adept::Application.load_tasks

task :env do
  puts ENV['AWS_ACCESS_KEY_ID']
  puts ENV['AWS_SECRET_ACCESS_KEY']
  puts ENV['S3_BUCKET']
end
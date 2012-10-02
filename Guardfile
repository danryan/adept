require 'active_support/inflector'

guard :bundler do
  watch('Gemfile')
end

group :frontend do
  guard :pow do
    watch('.rvmrc')
    watch(%r{^\.pow(rc|env)$})
    watch('Gemfile.lock')
    watch(%r{^config/.+\.rb$})
  end

  guard 'livereload' do
    watch(%r{app/views/.+\.(erb|haml|slim)$})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
    # Rails Assets Pipeline
    watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*}) { |m| "/assets/#{m[2]}" }
  end
end

group :backend do
  guard 'spork', wait: 50 do
    watch('Gemfile')
    watch('Gemfile.lock')
    watch('config/application.rb')
    watch('config/environment.rb')
    watch(%r{^config/environments/.+\.rb})
    watch(%r{^config/initializers/.+\.rb})
    watch('spec/spec_helper.rb')
  end

  # guard :rspec, cli: "--color --drb -r rspec/instafail -f doc -f RSpec::Instafail", bundler: false, all_after_pass: false, all_on_start: false, keep_failed: false do
  guard :rspec, cli: "--color --drb -f doc", bundler: false, all_after_pass: false, all_on_start: false, keep_failed: false do
    watch('spec/spec_helper.rb') { "spec" }
    watch('app/controllers/application_controller.rb') { "spec/controllers" }
    watch('config/routes.rb') { "spec/routing" }
    watch(%r{^spec/support/(requests|controllers|mailers|models)_helpers\.rb}) do |m|
      "spec/#{m[1]}"
    end
    watch(%r{^spec/.+_spec\.rb})

    watch(%r{^app/controllers/(.+)_(controller)\.rb}) do |m|
      %W[
        spec/routing/#{m[1]}_routing_spec.rb
        spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb
        spec/requests/#{m[1]}_spec.rb
      ]
    end

    watch(%r{^app/(.+)\.rb}) { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^lib/(.+)\.rb}) { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^spec/factories/(.+)\.rb$}) do |m|
      %W[
      spec/models/#{m[1].singularize}_spec.rb
      spec/controllers/#{m[1]}_controller_spec.rb
      spec/requests/#{m[1]}_spec.rb
    ]
    end

  end
end

# group :doc, :backend do
# guard 'annotate', notify: false, position: 'after', routes: true, show_indexes: true do
  # watch('db/schema.rb')
  # watch('app/models/**/*.rb')
  # watch('config/routes.rb')
# end
# end

# Sample config for Rails Best Practices
# See README for details

# group :rbp do
#   guard 'rails_best_practices' do
#     watch(%r{^(app|lib|config|vendor|spec)/(.+)\.rb$})
#     # watch(%r{^lib/(.+)\.rb$})
#     # watch(%r{^config/(.+)\.rb$})
#     # watch(%r{^vendor/(.+)\.rb$})
#     # watch(%r{^spec/(.+)\.rb$})
#   end
# end

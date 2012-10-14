require 'active_support/inflector'

guard :bundler do
  watch('Gemfile')
end

group :frontend do
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
    watch('spec/feature_helper.rb')
    watch('features/support/**/*.rb')
    watch(%r{config/.+\.yml})

    # watch(%r{^spec/support/.+\.rb})
  end

  # guard :rspec, cli: "--color --drb -r rspec/instafail -f doc -f RSpec::Instafail", bundler: false, all_after_pass: false, all_on_start: false, keep_failed: false do
  guard :rspec, cli: "--color --drb -f doc", bundler: false, all_after_pass: false, all_on_start: false, keep_failed: false do
    watch('spec/spec_helper.rb') { "spec" }
    # watch('app/controllers/application_controller.rb') { "spec/controllers" }
    watch('config/routes.rb') { "spec/routing" }
    watch(%r{^spec/support/(requests|controllers|mailers|models)_helpers\.rb}) do |m|
      "spec/#{m[1]}"
    end
    watch(%r{^spec/.+_spec\.rb})

    watch(%r{^app/controllers/.*/(.+)_(controller)\.rb}) do |m|
      %W[
        spec/routing/#{m[1]}_routing_spec.rb
        spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb
        spec/requests/#{m[1]}_spec.rb
      ]
    end

    watch(%r{^app/views/(.*)/[^/]+}) do |m|
      %W[
        spec/controllers/#{m[1]}_controller_spec.rb
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

  guard 'cucumber', cli: '--drb --profile guard', all_on_start: false, all_after_pass: false,run_all: { cli: "--no-profile -f fuubar features" } do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})          { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1].pluralize}/*.feature")][0] || 'features' }
  end

end

group :acceptance do
  guard :spinach do
    watch(%r|^features/(.*)\.feature|)
    watch(%r|^features/steps/(.*)([^/]+)\.rb|) do |m|
      "features/#{m[1]}#{m[2]}.feature"
    end
  end
end

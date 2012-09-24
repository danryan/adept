namespace :guard do
  desc "Run guard frontend"
  task :frontend do
    sh %{bundle exec guard start -g frontend}
  end

  desc "Run guard backend"
  task :backend do
    sh %{bundle exec guard start -g backend}
  end
end

task :guard => 'guard:backend'

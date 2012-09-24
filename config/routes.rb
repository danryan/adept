Adept::Application.routes.draw do
  resources :packages
  resources :distributions
  resources :repositories

  get 'apt' => 'repositories#index'
  get 'apt/pool' => 'repositories#pool'
  get 'apt/pool/:component' => 'repositories#component', :as => :apt_component
  get 'apt/pool/:component/:letter' => 'repositories#letter', :as => :apt_letter
  get 'apt/pool/:component/:letter/:name' => 'repositories#name', :name => /[^\/]+/, :as => :apt_name
  get 'apt/pool/:component/:letter/:name/:package' => 'repositories#package', :package => /[^\/]+/, :name => /[^\/]+/, :as => :apt_package
end

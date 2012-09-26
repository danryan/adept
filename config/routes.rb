Adept::Application.routes.draw do
  root :to => 'repositories#index'
  
  resources :packages
  # resources :distributions
  resources :repositories do
    resources :distributions
  end

  get 'apt' => 'apt#index'
  get 'apt/pool' => 'apt#pool'
  get 'apt/pool/:component' => 'apt#component', 
      :as => :apt_component
  get 'apt/pool/:component/:letter' => 'apt#letter', 
      :as => :apt_letter
  get 'apt/pool/:component/:letter/:name' => 'apt#name', 
      :name => /[^\/]+/, 
      :as => :apt_name
  get 'apt/pool/:component/:letter/:name/:package' => 'apt#package', 
      :package => /[^\/]+/, 
      :name => /[^\/]+/, 
      :as => :apt_package
end

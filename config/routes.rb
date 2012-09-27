Adept::Application.routes.draw do
  root :to => 'repositories#index'
  
  resources :packages
  # resources :distributions
  resources :repositories do
    resources :distributions
  end

  get 'apt' => 'apt#index'
  get 'apt/pool' => 'apt#pool',
      :as => :apt_pool
  get 'apt/pool/:component' => 'apt#component', 
      :as => :apt_component
  get 'apt/pool/:component/:prefix' => 'apt#prefix', 
      :as => :apt_prefix
  get 'apt/pool/:component/:prefix/:name' => 'apt#name', 
      :name => /[^\/]+/, 
      :as => :apt_name
  get 'apt/pool/:component/:prefix/:name/:package' => 'apt#package', 
      :package => /[^\/]+/, 
      :name => /[^\/]+/, 
      :as => :apt_package

  get 'apt/dist' => 'apt#dist',
      :as => :apt_dist
  get 'apt/dist/:codename' => 'apt#codename',
      :as => :apt_codename
  get 'apt/dist/:codename/Release' => 'apt#dist_release',
      :as => :apt_dist_release,
      :format => 'txt'
  get 'apt/dist/:codename/:component' => 'apt#dist_component',
      :as => :apt_dist_component
  get 'apt/dist/:codename/:component/binary-:arch' => 'apt#dist_arch',
      :as => :apt_dist_arch
  get 'apt/dist/:codename/:component/binary-:arch/Release' => 'apt#dist_arch_release',
      :as => :apt_dist_arch_release,
      :format => 'txt'
  get 'apt/dist/:codename/:component/binary-:arch/Packages' => 'apt#dist_arch_packages',
      :as => :apt_dist_arch_packages
end

require 'exception_app_constraint'

Adept::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :repositories do
        resources :packages
        resources :distributions
      end
    end
  end

  root to: 'home#index'

  devise_for :users, 
    controllers: { 
      registrations: 'users/registrations', 
      passwords: 'users/passwords',
      sessions: 'users/sessions'
    }

  # mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  as :user do
    get 'sign_in' => 'devise/sessions#new', as: :sign_in
    post 'sign_in' => 'devise/sessions#create', as: :sign_in
    delete 'sign_out' => 'devise/sessions#destroy', as: :sign_out
    get 'sign_out' => 'devise/sessions#destroy', as: :sign_out
    get 'sign_up' => 'devise/registrations#new', as: :sign_up
    post 'sign_up' => 'devise/registrations#create', as: :sign_up
  end

  resources :repositories, shallow: true do
    resources :distributions
    resources :packages
  end

  scope module: :apt, constraints: { user_agent: /APT/ } do
    scope ':repository_id' do
      get 'dists/:codename/:component/Release' => :release, as: :release, format: 'txt'
      get 'dists/:codename/:component/binary-:arch/Release' => :arch_release, as: :arch_release, format: 'txt'
      get 'dists/:codename/:component/binary-:arch/Packages' => :arch_packages, as: :arch_packages, format: 'txt'
      get 'pool/:prefix/:name/:package' => :package, as: :package, package: /[^\/]+/, name: /[^\/]+/, prefix: /[^\/]+/
    end
  end

  constraints(ExceptionAppConstraint) do
    match '/404', :to => 'errors#not_found'
    match '/401', :to => 'errors#unauthorized'
    match '/403', :to => 'errors#forbidden'
    match '/500', :to => 'errors#internal_server_error'
    match '*path', :to => 'errors#not_found'
  end
end

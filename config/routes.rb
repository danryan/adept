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
    controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }

  as :user do
    get 'sign_in' => 'devise/sessions#new', as: :sign_in
    post 'sign_in' => 'devise/sessions#create', as: :sign_in
    delete 'sign_out' => 'devise/sessions#destroy', as: :sign_out
    get 'sign_out' => 'devise/sessions#destroy', as: :sign_out
    get 'sign_up' => 'devise/registrations#new', as: :sign_up
    post 'sign_up' => 'devise/registrations#create', as: :sign_up
  end

  resources :repositories do
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
end

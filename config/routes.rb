Adept::Application.routes.draw do

  resources :repositories do
    resources :distributions
    resources :packages
  end

  get 'apt' => 'apt#index'

  namespace :apt do
    resources :dists, only: [ :index, :show ] do
      get 'Release' => 'dists#release', as: :release, format: :txt
      get ':component' => 'dists#component', as: :component
      get ':component/binary-:arch' => 'dists#arch', as: :arch
      get ':component/binary-:arch/Release' => 'dists#arch_release', as: :arch_release, format: :txt
      get ':component/binary-:arch/Packages' => 'dists#arch_packages', as: :arch_packages, format: :txt
    end

    resources :pools, only: [ :index, :show ], path: :pool do
      get ':prefix' => 'pools#prefix', as: :prefix
      get ':prefix/:name' => 'pools#name', as: :name, name: /[^\/]+/
      get ':prefix/:name/:package' => 'pools#package', as: :package, package: /[^\/]+/, name: /[^\/]+/
    end
  end

  root to: 'home#index'
end

Adept::Application.routes.draw do
  root to: 'home#index'

  devise_for :users #, skip: [ :sessions ]

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

  scope '/:user/:repo', :as => 'apt' do
    get '/' => 'apt#index'
    scope :module => :apt do
      resources :dists, only: [ :index, :show ] do
        get 'Release' => 'dists#release', as: :release, format: 'txt'
        get ':component' => 'dists#component', as: :component
        get ':component/binary-:arch' => 'dists#arch', as: :arch
        get ':component/binary-:arch/Release' => 'dists#arch_release', as: :arch_release, format: 'txt'
        get ':component/binary-:arch/Packages' => 'dists#arch_packages', as: :arch_packages, format: 'txt'
      end

      resources :pools, only: [ :index, :show ], path: :pool do
        get ':prefix' => 'pools#prefix', as: :prefix, prefix: /[^\/]+/
        get ':prefix/:name' => 'pools#name', as: :name, name: /[^\/]+/, prefix: /[^\/]+/
        get ':prefix/:name/:package' => 'pools#package', as: :package, package: /[^\/]+/, name: /[^\/]+/, prefix: /[^\/]+/
      end
    end
  end
end

#== Route Map
# Generated on 01 Oct 2012 22:22
#
#                 user_session POST   /users/sign_in(.:format)                                                         devise/sessions#create
#         destroy_user_session DELETE /users/sign_out(.:format)                                                        devise/sessions#destroy
#                user_password POST   /users/password(.:format)                                                        devise/passwords#create
#            new_user_password GET    /users/password/new(.:format)                                                    devise/passwords#new
#           edit_user_password GET    /users/password/edit(.:format)                                                   devise/passwords#edit
#                              PUT    /users/password(.:format)                                                        devise/passwords#update
#     cancel_user_registration GET    /users/cancel(.:format)                                                          devise/registrations#cancel
#            user_registration POST   /users(.:format)                                                                 devise/registrations#create
#        new_user_registration GET    /users/sign_up(.:format)                                                         devise/registrations#new
#       edit_user_registration GET    /users/edit(.:format)                                                            devise/registrations#edit
#                              PUT    /users(.:format)                                                                 devise/registrations#update
#                              DELETE /users(.:format)                                                                 devise/registrations#destroy
#            user_confirmation POST   /users/confirmation(.:format)                                                    devise/confirmations#create
#        new_user_confirmation GET    /users/confirmation/new(.:format)                                                devise/confirmations#new
#                              GET    /users/confirmation(.:format)                                                    devise/confirmations#show
#     repository_distributions GET    /repositories/:repository_id/distributions(.:format)                             distributions#index
#                              POST   /repositories/:repository_id/distributions(.:format)                             distributions#create
#  new_repository_distribution GET    /repositories/:repository_id/distributions/new(.:format)                         distributions#new
# edit_repository_distribution GET    /repositories/:repository_id/distributions/:id/edit(.:format)                    distributions#edit
#      repository_distribution GET    /repositories/:repository_id/distributions/:id(.:format)                         distributions#show
#                              PUT    /repositories/:repository_id/distributions/:id(.:format)                         distributions#update
#                              DELETE /repositories/:repository_id/distributions/:id(.:format)                         distributions#destroy
#          repository_packages GET    /repositories/:repository_id/packages(.:format)                                  packages#index
#                              POST   /repositories/:repository_id/packages(.:format)                                  packages#create
#       new_repository_package GET    /repositories/:repository_id/packages/new(.:format)                              packages#new
#      edit_repository_package GET    /repositories/:repository_id/packages/:id/edit(.:format)                         packages#edit
#           repository_package GET    /repositories/:repository_id/packages/:id(.:format)                              packages#show
#                              PUT    /repositories/:repository_id/packages/:id(.:format)                              packages#update
#                              DELETE /repositories/:repository_id/packages/:id(.:format)                              packages#destroy
#                 repositories GET    /repositories(.:format)                                                          repositories#index
#                              POST   /repositories(.:format)                                                          repositories#create
#               new_repository GET    /repositories/new(.:format)                                                      repositories#new
#              edit_repository GET    /repositories/:id/edit(.:format)                                                 repositories#edit
#                   repository GET    /repositories/:id(.:format)                                                      repositories#show
#                              PUT    /repositories/:id(.:format)                                                      repositories#update
#                              DELETE /repositories/:id(.:format)                                                      repositories#destroy
#                         root        /                                                                                home#index
#                          apt GET    /:user/:repo(/apt)(.:format)                                                     apt#index
#         apt_apt_dist_release GET    /:user/:repo(/apt)/apt/dists/:dist_id/Release(.:format)                          apt/dists#release {:format=>"txt"}
#       apt_apt_dist_component GET    /:user/:repo(/apt)/apt/dists/:dist_id/:component(.:format)                       apt/dists#component
#            apt_apt_dist_arch GET    /:user/:repo(/apt)/apt/dists/:dist_id/:component/binary-:arch(.:format)          apt/dists#arch
#    apt_apt_dist_arch_release GET    /:user/:repo(/apt)/apt/dists/:dist_id/:component/binary-:arch/Release(.:format)  apt/dists#arch_release {:format=>"txt"}
#   apt_apt_dist_arch_packages GET    /:user/:repo(/apt)/apt/dists/:dist_id/:component/binary-:arch/Packages(.:format) apt/dists#arch_packages {:format=>"txt"}
#                apt_apt_dists GET    /:user/:repo(/apt)/apt/dists(.:format)                                           apt/dists#index
#                 apt_apt_dist GET    /:user/:repo(/apt)/apt/dists/:id(.:format)                                       apt/dists#show
#          apt_apt_pool_prefix GET    /:user/:repo(/apt)/apt/pool/:pool_id/:prefix(.:format)                           apt/pools#prefix {:prefix=>/[^\/]+/}
#            apt_apt_pool_name GET    /:user/:repo(/apt)/apt/pool/:pool_id/:prefix/:name(.:format)                     apt/pools#name {:name=>/[^\/]+/, :prefix=>/[^\/]+/}
#         apt_apt_pool_package GET    /:user/:repo(/apt)/apt/pool/:pool_id/:prefix/:name/:package(.:format)            apt/pools#package {:package=>/[^\/]+/, :name=>/[^\/]+/, :prefix=>/[^\/]+/}
#                apt_apt_pools GET    /:user/:repo(/apt)/apt/pool(.:format)                                            apt/pools#index
#                 apt_apt_pool GET    /:user/:repo(/apt)/apt/pool/:id(.:format)                                        apt/pools#show

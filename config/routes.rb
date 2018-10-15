require 'sidekiq/web'


Rails.application.routes.draw do
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path: '/'

  ActiveAdmin.routes(self)

  resources :adverts, except: :index

  root to: 'adverts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

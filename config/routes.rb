Rails.application.routes.draw do
  devise_for :users, path: '/'

  resources :adverts, except: :index

  root to: 'adverts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

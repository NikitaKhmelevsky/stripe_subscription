Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]

end

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'static_pages#home'
  get  'pricing' => 'static_pages#pricing'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :subscriptions, only: [:new]

  mount StripeEvent::Engine => '/webhooks'
end

Rails.application.routes.draw do
  get 'rooms/show'

  get 'rooms/create'

  devise_for :user
  devise_scope :user do
    get 'users/sign_out' => 'devise/session#destroy'
  end
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show]
  resources :posts, only: [:index, :new, :create, :destroy]

  namespace :api, path: '/api' do
    get 'top', to: 'top#index'
  end
end

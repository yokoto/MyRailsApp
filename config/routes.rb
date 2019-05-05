Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users#, controllers: {
    #sessions:'users/sessions'
  #}
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  resources :users, only: [:index, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # change default devise path from 'users/action_name'
  # to '/action_name'
  devise_for :users, path: ''

  # Or it's possible to change default devise path only for specific endpoints
  # as :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end

  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :relationships

  get 'account', to: 'relationships#show'
  # post 'account/add_friend', to: 'relationships#add_friend'


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

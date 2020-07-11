Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root 'welcome#index'
  get '/user' => "users#show", :as => :user_root
  resources :books
  get 'external', to: 'books#external'
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

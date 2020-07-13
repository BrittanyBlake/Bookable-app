Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root 'welcome#index'
  get '/user' => "users#show", :as => :user_root
  resources :books
  post 'new_book', to: 'books#new'
  get 'external', to: 'books#external'
  resources :groups
  resources :books_search
  get 'goodreads', to: 'books_search#index'
  get 'result', to: 'books_search#results'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

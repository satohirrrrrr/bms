Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    get  '/books/new',         action: :new,    controller: 'books'
    put  '/books/sync',        action: :sync,   controller: 'books'
    post '/users/delete/:id',  action: :delete, controller: 'users'
    resources :books, only: [:index, :show, :create, :update]
    resources :users, only: [:index, :show, :create, :update]
  end
end

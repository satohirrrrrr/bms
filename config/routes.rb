Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    get '/books/new', action: :new, controller: 'books'
    put '/books/sync', action: :sync, controller: 'books'
    resources :books, only: [:index, :show, :create, :update]
  end
end

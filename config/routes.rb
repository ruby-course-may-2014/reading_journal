Rails.application.routes.draw do
  get 'books/index'

  root to: 'welcome#index'
  resources :books
end

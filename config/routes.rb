# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins, :authors, :book_types, :publishers, :subjects, :books, :loans
  end
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#books'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    get 'author/:author_id/:author', to: 'search#author', as: 'search_author'
    get 'publisher/:publisher_id/:publisher', to: 'search#publisher', as: 'search_publisher'
    get 'book_type/:book_type_id/:book_type', to: 'search#book_type', as: 'search_book_type'
  end

  devise_for :admins, skip: [:registrations]
  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

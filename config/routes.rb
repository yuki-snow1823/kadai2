Rails.application.routes.draw do
  root :to => 'home#top'
  get 'books' => 'books#index', as:'index_book'
  get 'books/show' => 'books#show'
  get 'books/edit' => 'books#edit'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show' , as: 'book'
end

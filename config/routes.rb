Rails.application.routes.draw do
  
  get 'orders/new' => "public/orders#new"
  post "orders/confirm" => "public/orders#confirm"
  get 'orders/complete' => "public/orders#complete"
  post "orders" => "public/orders#create"
  get 'orders' => "public/orders#index"
  get 'orders/:id' => "public/orders#show"

  get 'addresses' => "public/addresses#index"
  post "addresses" => "public/addresses#create"
  get 'addresses/:id/edit' => "public/addresses#edit",as: "edit_address"
  patch "addresses/:id" => "public/addresses#update",as: "update_address"
  delete "addresses/:id" => "public/addresses#destroy",as: "delete_address"

  get "cart_items" => "public/cart_items#index"
  patch "cart_items/:id" => "public/cart_items#update",as: "cart_item"
  post "cart_items" => "public/cart_items#create"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"
  delete "cart_items/:id" => "public/cart_items#destroy"

  get "items" => "public/items#index"
  get "items/:id" => "public/items#show",as: "item"
    
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  get "customers/my_page" => "public/customers#show"
  get "customers/information/edit" => "public/customers#edit"
  patch "customers/information" => "public/customers#update"
  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw"

  root to: 'public/homes#top'
  get "about" => 'public/homes#about'
    
  namespace :admin do
    get 'order_items/update'
  end
  namespace :admin do
    resources :orders,only: [:show,:update]
  end
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :items,only: [:new,:create,:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres,only: [:index,:create,:edit,:update]
  end
  namespace :admin do
    root to: 'homes#top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

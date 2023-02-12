Rails.application.routes.draw do
  
  resources :cart_items,only: [:index]

  resources :items,only: [:index,:show]
    
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

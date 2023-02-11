Rails.application.routes.draw do
    root to: 'public/homes#top'
    get 'public/homes/about'
    
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
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

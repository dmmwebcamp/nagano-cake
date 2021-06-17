Rails.application.routes.draw do
  
  devise_for :customers
  devise_for :admins
  
  
  namespace :admin do
    get'top' => 'homes#top'
    resources :customers
    resources :orders
    resources :genres
    resources :products
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'
    resources :customers
      get 'customers/leave' => 'customers#leave'
      patch 'customers/withdraw' => 'customers#withdraw' 
    resources :orders
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/thanks' => 'orders#thanks'
    resources :cart_products
      delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :products
    resources :destinations
  end
  
end

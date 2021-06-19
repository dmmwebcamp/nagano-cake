Rails.application.routes.draw do
  
 devise_for :admins, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
  
  
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

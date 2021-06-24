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
    resources :order_details
  end

  scope module: :public do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'
    resources :customers
      get 'customers/leave' => 'customers#leave'
      patch 'customers/withdraw' => 'customers#withdraw'
   
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/confirm' => 'orders#new'
      get 'orders/thanks' => 'orders#thanks'
      resources :orders ,except: [:edit, :destroy]
    
    resources :cart_products
    resources :products
    resources :destinations
  end

end

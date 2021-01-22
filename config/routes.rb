Rails.application.routes.draw do
  root to: "home#index"

  devise_for :owners, controllers: {
    sessions: 'owners/sessions',
    passwords: 'owners/passwords',
    registrations: 'owners/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do   # マイページへ遷移
    get 'my_page' => 'users/registrations#my_page'
  end
  devise_scope :owner do
    get 'shop_page' => 'owners/registrations#shop_page'
  end

  resources :users, only: [:edit, :update]
  resources :orders, only:[:index, :create]

  resources :shops do
    resources :comments, only:[:index, :create]
    collection do
      get 'search'
    end
  end
  
end

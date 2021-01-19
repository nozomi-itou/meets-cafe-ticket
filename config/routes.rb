Rails.application.routes.draw do
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

  root to: "shops#index"

  resources :users, only: [:edit, :update]
  resources :orders, only:[:index, :create]

end

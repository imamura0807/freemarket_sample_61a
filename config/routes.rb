Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :users, only: [:create, :edit, :new] do
    collection do
      get 'top', to: 'users#top'
      get 'logout', to: 'users#logout'
      get 'mypage', to: 'users#mypage'
    end
  end

  resources :products, only: [:index, :new, :show, :create] do
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        get 'get_size_type', defaults: { format: 'json' }
      end
        
    resources :purchases, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'buy', to: 'purchase#buy'
        get 'done', to: 'purchase#done'
      end
    end
  end

  resources :cards, only: [:new, :edit, :show,:destroy] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay' #トークン発行、カード登録
    end
  end
  
  resources :signup do
    collection do
      get 'info', to: 'signup#info'
      get 'authentication', to: 'signup#authentication'
      get 'address', to: 'signup#address'
      get 'payment_way', to: 'signup#payment_way'
      get 'done', to: 'signup#done'
    end
  end

end
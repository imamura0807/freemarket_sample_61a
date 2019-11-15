Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :users, only: [:create, :edit, :new] do
    collection do
      get 'top'
      get 'logout'
      get 'mypage'
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
      get 'info'
      get 'authentication'
      get 'address'
      get 'payment_way' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  resources :category, only: [:new]

end
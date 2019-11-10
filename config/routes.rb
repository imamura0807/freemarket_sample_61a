Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :users, only: [:create, :destroy, :edit, :show, :new] do
    collection do
      get 'top'
      get 'login'
    end
  end

  resources :products, only: [:index, :new, :show, :create] do
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        get 'get_size', defaults: { format: 'json' }
      end
  end

  resources :tests, only: [:index]

  resources :cards, only: [:new, :edit, :show,:destroy] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
    end
  end

  # get  'sign-up' => 'tests#top'
  # get  'log-in' => 'tests#login'
  # get  'user-confirm'　=> 'users#new'

  # 商品購入確認画面 仮のルート
  resources :purchases, only: [:new]
  
  resources :signup do
    collection do
      get 'info'
      get 'authentication'
      get 'address'
      get 'payment_way' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end

end
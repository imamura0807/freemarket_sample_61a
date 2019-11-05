Rails.application.routes.draw do
  get 'purchases/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'



  resources :products, only: [:new, :show]
  resources :users, only: [:create, :destroy, :edit, :show, :new]
  resources :products, only: [:new, :show, :create] do
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
  end

  resources :users, only: [:destroy, :edit, :show]

  resources :tests, only: [:index]
  resources :cards, only: [:new]
  get  'sign-up' => 'tests#top'
  get  'log-in' => 'tests#login'
  # 商品購入確認画面 仮のルート
  resources :purchases, only: [:new]
  get  'sign-up' => 'tests#top'
  # get  'user-confirm'　=> 'users#new'
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


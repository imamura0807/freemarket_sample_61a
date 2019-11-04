Rails.application.routes.draw do
  get 'purchases/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :products, only: [:new, :show]
  resources :users, only: [:create, :destroy, :edit, :show, :new]
  resources :tests, only: [:index]
  get  'sign-up' => 'tests#top'
  get  'log-in' => 'tests#login'
  # 商品購入確認画面 仮のルート
  resources :purchases, only: [:new]

end
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


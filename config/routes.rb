Rails.application.routes.draw do
  get 'purchases/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:new, :show, :create]
  resources :users, only: [:destroy, :edit, :show]
  resources :tests, only: [:index]
  get  'sign-up' => 'tests#top'
  get  'log-in' => 'tests#login'
  # 商品購入確認画面 仮のルート
  resources :purchases, only: [:new]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'step5' # 登録完了後のページ
    end
  end

end
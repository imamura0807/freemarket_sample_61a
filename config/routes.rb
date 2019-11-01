Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:new]
  resources :users, only: [:create, :destroy, :edit, :show,]
  resources :tests, only: [:index]
  get  'sign-up' => 'tests#top'
end

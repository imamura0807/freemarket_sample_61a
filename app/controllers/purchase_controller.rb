class PurchaseController < ApplicationController
  before_action :set_product, only: [:index]

  def index
    @user = User.find(current_user.id)
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card_number = customer.cards.retrieve(card.card_id)
  end

  def buy #クレジットカードで商品購入
    card = Card.where(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:product_id]) # 購入した際の情報を元に引っ張ってくる
      card = current_user.card # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      if @product.update(status: 1, user_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to action: 'done' 
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to product_path
      end
    end
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end
end

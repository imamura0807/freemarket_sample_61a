class PurchaseController < ApplicationController
  before_action :set_product, only: [:index]

  def index
    @user = User.find(current_user.id)
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card_number = customer.cards.retrieve(card.card_id)
  end

  def buy
    redirect_to action: 'done' 
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end
end

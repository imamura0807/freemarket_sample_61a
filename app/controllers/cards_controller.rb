class CardsController < ApplicationController
  include CommonActions
  require "payjp"
  before_action :set_card
  before_action :set_parents #set_parentsはcontoroller/concerns/common_action.rbに記述


  def new
    card = Card.where(user_id: current_user.id)
    redirect_to  cards_path if card.exists?
  end

  def edit
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay #payjpとCardのデータベース作成
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
      description: 'test',
      card: params['payjp-token']
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path
      else
        redirect_to pay_cards_path
      end
    end
  end


  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to cards_path, notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to cards_path, alert: "削除できませんでした"
    end
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end

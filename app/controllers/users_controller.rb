class UsersController < ApplicationController
  include CommonActions
  before_action :set_parents #set_parentsはcontoroller/concerns/common_action.rbに記述

  def edit
  end
  
  def show
  end

  def new

    # @address = Address.new(address_params)
  end

  def create
    
  end

  def mypage
    
  end

  def top
  end


  def logout
  end

  # private

  # def address_params
  #   params[:address].permit(:prefecture)
  #   params[:address].permit(:created_at, :updated_at, :name, :name_kana, :postal_code, :prefecture, :mayor_town, :address, :building_name, :phone_number)
  #   params[:address].permit(:created_at, :updated_at, :name, :name_kana, :postal_code, :prefecture, :mayor_town, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  # end

end

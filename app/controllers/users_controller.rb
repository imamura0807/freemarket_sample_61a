class UsersController < ApplicationController
  
  def destroy
  end

  def edit
  end
  
  def show
  end

  def new

    # @address = Address.new(address_params)
  end

  def create
    
  end

  # private

  # def address_params
  #   params[:address].permit(:prefecture)
  #   params[:address].permit(:created_at, :updated_at, :name, :name_kana, :postal_code, :prefecture, :mayor_town, :address, :building_name, :phone_number)
  #   params[:address].permit(:created_at, :updated_at, :name, :name_kana, :postal_code, :prefecture, :mayor_town, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  # end

end

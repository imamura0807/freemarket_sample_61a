class UsersController < ApplicationController
  

  def edit
 
  end
  
  def show
    @nickname = current_user.nickname
    # @user = User.where(id: current_user.id)
  end

  def new
  end

  def create
    
  end

  def mypage
   
  end

  def top
  end


  def logout
  end

  private

  # def user_params
  #   params.permit(:id)
  # end
  # def address_params
  #   params[:address].permit(:prefecture)
  #   params[:address].permit(:created_at, :updated_at, :name, :name_kana, :postal_code, :prefecture, :mayor_town, :address, :building_name, :phone_number)
  #   params[:address].permit(:created_at, :updated_at, :name, :name_kana, :postal_code, :prefecture, :mayor_town, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  # end

end

class SignupController < ApplicationController

  def info
    @user = User.new
  end

  def authentication
    # infoで入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    @user = User.new # 新規インスタンス作成
  end

  def address
    # authenticationで入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def payment_way
    # addressで入力された値をsessionに保存
    session[:address_number] = user_params[:address_number]
    session[:address_prefecture] = user_params[:address_prefecture]
    session[:address_mayor_town] = user_params[:address_mayor_town]
    session[:address_block] = user_params[:address_block]
    session[:address_building] = user_params[:address_building]
    session[:address_phone_numbe] = user_params[:address_phone_numbe]
    @user = User.new
    @user.build_card
  end

  def create # sessionに保存された値をインスタンスに渡す
    
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],

      phone_number: session[:phone_number],

      address_number: session[:address_number],
      address_prefecture: session[:address_prefecture],
      address_mayor_town: session[:address_mayor_town],
      address_block: session[:address_block],
      address_building: session[:address_building],
      address_phone_number: session[:address_phone_number],

      
    )

    @user.build_card(user_params[:card_attributes]) # 入力値を引数で渡す

    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      redirect_to '/users/top '
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birthdate_year,
      :birthdate_month,
      :birthdate_day,
      :phone_number,
      :address_number,
      :address_prefecture,
      :address_mayor_town,
      :address_block,
      :address_building,
      :address_phone_number,

     card_attributes:[:id, :card_number, :expire_month, :expire_year, :code]
  )
  end


end

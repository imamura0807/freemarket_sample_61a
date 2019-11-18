class SignupController < ApplicationController
  before_action :validates_info, only: :authentication# infoのバリデーション
  before_action :validates_authentication, only: :address # authenticationのバリデーション
  before_action :validates_address, only: :payment_way# addressのバリデーション


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
    
    # @user.build_card
  end

  def create # sessionに保存された値をインスタンスに渡す
    session[:payjp_token] = params[:'payjp-token'] #payment_wayで入力された値。イベント発火の際、発行されるトークンをsessionに代入

    @user = User.new(
      nickname: session[:nickname], #infoで入力された値
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

      phone_number: session[:phone_number], #authenticationで入力された値

      address_number: session[:address_number],#addressで登録された値
      address_prefecture: session[:address_prefecture],
      address_mayor_town: session[:address_mayor_town],
      address_block: session[:address_block],
      address_building: session[:address_building],
      address_phone_number: session[:address_phone_number],

      
    )

    if @user.save
      session[:id] = @user.id
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']  #トークン作成
      if session[:payjp_token].blank?
        redirect_to payment_way_signup_index_path
      else
        customer = Payjp::Customer.create(
          description: 'test',
          card: session[:payjp_token]
          )
          @card = Card.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
          if @card.save
            sign_in @user
          else
            redirect_to payment_way_signup_index_path
          end
      end

      redirect_to done_signup_index_path
    else
      redirect_to top_users_path
    end
  end


  def done
    # sign_in User.find(session[:id]) unless user_signed_in?
  end
# -------------バリデーション------------------------------------
  def validates_info
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
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname: session[:nickname],#sessionに保存された値をインスタンスに渡す
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
      
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
    render '/signup/info' unless @user.valid?(:validates_info)
  end

  def validates_authentication
    # authenticationで入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      email: session[:email],
      password: session[:password],

      phone_number: session[:phone_number]
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
    render '/signup/authentication' unless @user.valid?(:validates_authentication)
  end 

  def validates_address
    # addressで入力された値をsessionに保存
    session[:address_number] = user_params[:address_number]
    session[:address_prefecture] = user_params[:address_prefecture]
    session[:address_mayor_town] = user_params[:address_mayor_town]
    session[:address_block] = user_params[:address_block]
    session[:address_building] = user_params[:address_building]
    session[:address_phone_numbe] = user_params[:address_phone_numbe]
    @user = User.new(
      email: session[:email],
      password: session[:password],
      
      address_number: session[:address_number],#addressで登録された値
      address_prefecture: session[:address_prefecture],
      address_mayor_town: session[:address_mayor_town],
      address_block: session[:address_block],
      address_building: session[:address_building],
      address_phone_number: session[:address_phone_number]
    )
     # 仮で作成したインスタンスのバリデーションチェックを行う
     render '/signup/address' unless @user.valid?(:validates_address)

  end
# ------------バリデーション  end----------------------------------
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

    #  card_attributes:[:id, :card_number, :expire_month, :expire_year, :code]
    )
  end


end

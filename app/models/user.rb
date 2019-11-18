class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :card
  has_one :address
  has_many :products
  has_many :comments

  # accepts_nested_attributes_for :card

  enum year: { "2030": 1, "2029": 2, "2028": 3, "2027": 4, "2026": 5, "2025": 6, "2024": 7, "2023": 8, "2022": 9, "2021": 10, },_prefix: true
  enum month: { "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 11, "12": 12,},_prefix: true
  enum day: {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 11, "12": 12,"13": 13, "14": 14, "15": 15, "16": 16, "17": 17, "18": 18, "19": 20, "21": 22, "23": 23, "24": 24, "25": 25,"26": 26, "27": 27, "28": 28, "29": 29,},_prefix: true
  enum prefecture: { 北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7, 東京都: 8, 神奈川県: 9, 埼玉県: 10, 千葉県: 11, 茨城県: 12, 栃木県: 13, 群馬県: 14, 山梨県: 15, 新潟県: 16, 長野県: 17, 富山県: 18, 石川県: 19, 福井県: 20, 愛知県: 21, 岐阜県: 22, 静岡県: 23, 三重県: 24, 大阪府: 25, 兵庫県: 26, 京都府: 27, 滋賀県: 28, 奈良県: 29, 和歌山県: 30, 鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35, 徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39, 福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47}, _prefix: true

  # ----------バリデーション----------------------------------------------------
  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # info入力項目
  validates :nickname,                presence: true, length: {maximum: 20} ,on: :validates_info
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_info
  validates :password,                presence: true, length: {minimum: 8, maximum: 128}, on: :validates_info
  validates :password_confirmation,   presence: true, length: {minimum: 8, maximum: 128}, on: :validates_info
  validates :last_name,               presence: true, on: :validates_info
  validates :first_name,              presence: true, on: :validates_info
  validates :last_name_kana,          presence: true, on: :validates_info
  validates :first_name_kana,         presence: true, on: :validates_info
  validates :birthdate_year,          presence: true, on: :validates_info
  validates :birthdate_month,         presence: true, on: :validates_info
  validates :birthdate_day,           presence: true, on: :validates_info

  # authentication入力項目
  validates :phone_number,           presence: true, uniqueness: true, on: :validates_authentication

  # address 入力項目
  validates :address_number,           presence: true, length: {maximum: 6},on: :validates_address
  validates :address_prefecture,       presence: true, on: :validates_address
  validates :address_mayor_town,       presence: true, on: :validates_address
  validates :address_block,            presence: true, on: :validates_address
  validates :address_building,         absence: true,  on: :validates_address
  validates :address_phone_number,     absence: true,  on: :validates_address
# ------------------------バリデーション----end------------------------------------
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :card
  has_one :address
  has_many :products
  has_many :comments

  enum yaer: { "2030": 1, "2029": 2, "2028": 3, "2027": 4, "2026": 5, "2025": 6, "2024": 7, "2023": 8, "2022": 9, "2021": 10, },_prefix: true
  enum moon: { "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 11, "12": 12,},_prefix: true
  enum day: {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 11, "12": 12,"13": 13, "14": 14, "15": 15, "16": 16, "17": 17, "18": 18, "19": 20, "21": 22, "23": 23, "24": 24, "25": 25,"26": 26, "27": 27, "28": 28, "29": 29,},_prefix: true
end

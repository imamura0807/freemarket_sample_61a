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
  enum moon: {}
  enum day: {}
end

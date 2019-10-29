class Product < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many :comments
end

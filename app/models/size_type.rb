class SizeType < ApplicationRecord
  has_many :products
  has_many :sizes
  has_many :categories, through: :sizes
  has_ancestry
end

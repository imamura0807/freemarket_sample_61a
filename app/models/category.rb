class Category < ApplicationRecord
  has_many :products
  has_many :sizes
  has_many :size_types, through: :sizes
  # belongs_to :parent, class_name: :Category
  # has_many :children, class_name: :Category, foreign_key: :parent_id
  has_ancestry
end
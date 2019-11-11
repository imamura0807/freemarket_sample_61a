class Size < ApplicationRecord
  belongs_to :category
  belongs_to :size_type
end

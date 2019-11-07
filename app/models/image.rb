class Image < ApplicationRecord
  belongs_to :product, optional: true
  has_image_file :file
end

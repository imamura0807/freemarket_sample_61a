class AddColumnBrands < ActiveRecord::Migration[5.2]
  def change
    add_column    :brands, :category_id, :integer
  end
end

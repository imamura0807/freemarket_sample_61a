class AddColumnProducts5 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :category, foreign_key: true
    add_column    :products, :category_id, :integer
  end
end

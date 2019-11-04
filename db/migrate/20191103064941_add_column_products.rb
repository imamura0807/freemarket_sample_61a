class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prefecture, :integer, null: false
  end
end

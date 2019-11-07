class AddColumnProducts4 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :size, foreign_key: true
    add_column    :products, :size, :string
  end
end
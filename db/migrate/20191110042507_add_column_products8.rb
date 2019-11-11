class AddColumnProducts8 < ActiveRecord::Migration[5.2]
  def change
    remove_reference  :products, :brand, foreign_key: true
    add_column    :products, :brand, :string
  end
end
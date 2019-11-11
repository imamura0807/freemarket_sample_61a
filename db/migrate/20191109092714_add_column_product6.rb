class AddColumnProduct6 < ActiveRecord::Migration[5.2]
  def change
    remove_column  :products, :size, :string
    add_column    :products, :size_type_id, :integer
  end
end

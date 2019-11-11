class AddColumnSizes < ActiveRecord::Migration[5.2]
  def change
    remove_column  :sizes, :size, :string, null: false
    add_column    :sizes, :size_type_id, :integer
    add_column    :sizes, :category_id, :integer
  end
end
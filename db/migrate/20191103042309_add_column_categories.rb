class AddColumnCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :ancestry, :string, null: false
    add_column    :categories, :ancestry, :string
    add_index     :categories, :ancestry
  end
end

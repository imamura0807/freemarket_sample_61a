class AddColumnImages < ActiveRecord::Migration[5.2]
  def change
    remove_column  :images, :image, :string, null: false
    add_column    :images, :url, :string
  end
end

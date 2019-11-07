class AddColumnProducts3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :purchased_at, :datetime
    add_column    :products, :purchased_at, :integer
  end
end

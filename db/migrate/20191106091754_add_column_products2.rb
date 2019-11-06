class AddColumnProducts2 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :user, null: false, foreign_key: true
    remove_reference :products, :category, null: false, foreign_key: true
    remove_reference :products, :brand, null: false, foreign_key: true
    remove_reference :products, :size, null: false, foreign_key: true

    add_reference    :products, :user, foreign_key: true
    add_reference    :products, :category, foreign_key: true
    add_reference    :products, :brand, foreign_key: true
    add_reference    :products, :size, foreign_key: true
  end
end
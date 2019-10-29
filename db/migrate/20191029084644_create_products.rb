class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false
      t.integer :charge_burden, null: false
      t.integer :send_days, null: false
      t.integer :price, null: false
      t.integer :like
      t.datetime :purchased_at
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.timestamps
    end
  end
end

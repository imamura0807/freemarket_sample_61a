class CreateSizeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :size_types do |t|
      t.string "size_type", null: false
      t.string "ancestry"
      t.timestamps
    end
  end
end
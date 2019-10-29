class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :date, null: false
      t.string :code, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

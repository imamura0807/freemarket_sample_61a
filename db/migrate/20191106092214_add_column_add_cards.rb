class AddColumnAddCards < ActiveRecord::Migration[5.2]
  def change
    remove_column    :cards, :name,     :string,  null: false
    remove_column    :cards, :date,     :string,  null: false
    add_column    :cards, :card_number,     :integer,  null: false
    add_column    :cards, :expire_month,     :integer,  null: false
    add_column    :cards, :expire_year,     :integer,  null: false
    
  end
end

class RemoveCardNumberFromcards < ActiveRecord::Migration[5.2]
  def change
    remove_column  :cards, :card_number,     :integer,  null: false
    remove_column   :cards,:expire_month,   :integer,  null: false
    remove_column  :cards, :expire_year,     :integer,  null: false
    remove_column  :cards, :code,            :string,   null: false
  end
end

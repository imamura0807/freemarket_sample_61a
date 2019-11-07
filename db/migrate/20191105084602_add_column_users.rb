class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birthday,              :date,   null: false
    remove_column :users, :email,                 :string, null: false,default: ""
    remove_column :users, :phone_number,          :string, null: false
    add_column    :users, :email,                 :string, null: false, unique: true
    add_column    :users, :birthdate_year,        :integer, null: false
    add_column    :users, :birthdate_month,       :integer, null: false
    add_column    :users, :birthdate_day,         :integer, null: false
    add_column    :users, :address_last_name,     :string,  null: false
    add_column    :users, :address_first_name,    :string,  null: false
    add_column    :users, :address_last_name_kana,:string,  null: false
    add_column    :users, :address_first_name_kana,:string, null: false
    add_column    :users, :address_number,         :string, null: false
    add_column    :users, :address_prefecture,     :integer,null: false
    add_column    :users, :address_mayor_town,     :string, null: false
    add_column    :users, :address_block,          :string, null: false
    add_column    :users, :address_building,      :string
    add_column    :users, :address_phone_number,  :integer
    add_column    :users, :introduce,             :text

    

  end
end

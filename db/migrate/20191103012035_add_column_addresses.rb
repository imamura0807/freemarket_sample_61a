class AddColumnAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :nickname, :string, null: false
    remove_column :addresses, :email, :string, null: false, default: ""
    remove_column :addresses, :encrypted_password, :string, null: false, default: ""
    remove_column :addresses, :first_name, :string, null: false
    remove_column :addresses, :first_name_kana, :string, null: false
    remove_column :addresses, :last_name, :string, null: false
    remove_column :addresses, :last_name_kana, :string, null: false
    remove_column :addresses, :birthday, :date, null: false
    remove_column :addresses, :phone_number, :string, null: false
    remove_column :addresses, :image, :string
    add_column    :addresses, :name, :string, null: false
    add_column    :addresses, :name_kana, :string, null: false
    add_column    :addresses, :postal_code, :string, null: false
    add_column    :addresses, :prefecture, :integer, null: false
    add_column    :addresses, :mayor_town, :string, null: false
    add_column    :addresses, :address, :string, null: false
    add_column    :addresses, :building_name, :string, null: false
    add_column    :addresses, :phone_number, :string, null: false
    add_reference :addresses, :user, foreign_key: true
  end
end
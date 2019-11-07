class AddColumnAddressName < ActiveRecord::Migration[5.2]
  def change
    remove_column    :users, :address_last_name,     :string,  null: false
    remove_column    :users, :address_first_name,    :string,  null: false
    remove_column    :users, :address_last_name_kana,:string,  null: false
    remove_column    :users, :address_first_name_kana,:string, null: false
  end
end

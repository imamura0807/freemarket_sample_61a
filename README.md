# freemarket_sanple_61a データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|phone_number|string|null: false|
|image|string||
### Association
- has_one :card
- has_one :address
- has_many :products
- has_many :comments

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|postal_code|string|null: false|
|prefectures_id|integer|null: false|
|mayor_town|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|date|string|null: false|
|code|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|status|integer|null: false|
|charge_burden|integer|null: false|
|send_days|integer|null: false|
|price|integer|null: false|
|like|integer||
|purchased_at|datetime||
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|size|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :images
- belongs_to :brand
- belongs_to :size
- belongs_to :category
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|null: false, foreign_key: true|
### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :products
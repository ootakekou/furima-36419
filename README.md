## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| nickname           | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |

### Association
-has_many :items
-has_many :	purchases

## items テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| category_id        | integer    | null: false                    |
| money              | integer    | null: false                    |
| text               | text       | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase

## 	purchaseテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :delivery

## deliveries テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| city_number        | string     | null: false                    |
| build_name         | string     |                                |
| telephone          | string     | null: false                    |
| sold               | references | null: false, foreign_key: true |

### Association
-belongs_to :purchase

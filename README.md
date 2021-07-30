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
-has_many :solds

## items テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| category_id        | string     | null: false                    |
| money              | integer    | null: false                    |
| image              | text       | null: false                    |
| text               | text       | null: false                    |
| status_id          | string     | null: false                    |
| delivery_fee       | string     | null: false                    |
| prefectures_id     | string     | null: false                    |
| shipping_day       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :sold

## sold テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :delivery

## delivery テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefectures_id     | string     | null: false                    |
| city               | text       | null: false                    |
| city_number        | text       | null: false                    |
| build_name         | text       |                                |
| telephone          | string     | null: false                    |
| sold               | references | null: false, foreign_key: true |

### Association
-belongs_to :sold

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| nickname           | string | null: false |
| katakana           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false | 

### Association
-has_many :items
-has_many :solds

## items テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| category           | string     | null: false                    |
| money              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :sold

## sold テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| card_number        | integer    | null: false                    |
| expiry             | integer    | null: false                    |
| security_code      | string     | null: false                    |
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
| prefectures        | string     | null: false                    |
| city               | text       | null: false                    |
| city_number        | text       | null: false                    |
| build_name         | text       | null: false                    |
| telephone          | integer    | null: false                    |
| sold               | references | null: false, foreign_key: true |

### Association
-belongs_to :sold

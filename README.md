# テーブル設計

## users テーブル

| Column             | Type    | Options    |
| ------------------ | ------  | ---------- |
| nickname           | string  | null false |
| email              | string  | null false |
| encrypted_password | string  | null false |
| last_name          | string  | null false |
| first_name         | string  | null false |
| last_name-kana     | string  | null false |
| first_name-kana    | string  | null false |
| birthday           | date    | null false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null false                     |
| price                | integer    | null false                     |
| category_id          | integer    | null false                     |
| product_condition_id | integer    | null false                     |
| shipping_charges_id  | integer    | null false                     |
| shipping_area_id     | integer    | null false                     |
| days_to_ship_id      | integer    | null false                     |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null: false, foreign_key: true|
| item                   | references | null: false, foreign_key: true|

### Association

  belongs_to :user
  belongs_to :item
  has_one :address

## addressテーブル

| Column                    | Type          | Options                        |
| ------------------------- | ------------- | ------------------------------ |
| postal_code_id            | string        | null false                     |
| prefecture_id             | integer       | null false                     |
| city                      | string        | null false                     |
| addresses                 | string        | null false                     |
| building                  | string        |                                |
| phone_number              | string        | null false                     |
| order                     | references    | null: false, foreign_key: true |

### Association

  belongs_to :order
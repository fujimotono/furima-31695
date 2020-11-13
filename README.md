# テーブル設計

## users テーブル

| Column             | Type    | Options    |
| ------------------ | ------  | ---------- |
| nickname           | string  | null false |
| email              | string  | null false |
| encrypted_password | string  | null false |
| name full_width    | string  | null false |
| last-name          | string  | null false |
| first-name         | string  | null false |
| kana full_width    | string  | null false |
| last-name          | string  | null false |
| first-name         | string  | null false |
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
| seller_id            | integer    | null false                     |
| product-condition_id | integer    | null false                     |
| shipping-charges_id  | integer    | null false                     |
| shipping-area_id     | integer    | null false                     |
| days-to-ship_id      | integer    | null false                     |
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
| postal-code_id            | integer       | null false                     |
| prefecture_id             | integer       | null false                     |
| city                      | string        | null false                     |
| addresses                 | integer       | null false                     |
| building                  | string        |                                |
| phone-number              | string        | null false                     |
| item                      | references    | null: false, foreign_key: true |
| order                     | references    | null: false, foreign_key: true |

### Association

  belongs_to :order
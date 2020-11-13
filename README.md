# テーブル設計

## users テーブル

| Column             | Type    | Options    |
| ------------------ | ------  | ---------- |
| nickname           | string  | null false |
| email              | string  | null false |
| encrypted_password | string  | null false |
| name full-width    | string  | null false |
| kana full-width    | string  | null false |
| birthday           | date    | null false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column            | Type       | Options    |
| ----------------- | ---------- | --------   |
| name              | string     | null false |
| category          | text       | null false |
| price             | integer    | null false |
| seller            | text       | null false |
| product-condition | text       | null false |
| shipping-charges  | text       | null false |
| shipping-area     | text       | null false |
| days-to-ship      | test       | null false |
| image        | ActiveStorageで実装           |
| user         | references |                 |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column                 | Type       | Options  |
| ---------------------- | ---------- | -------- |
| user                   | references |          |
| items                  | references |          |

### Association

  belongs_to :user
  belongs_to :item
  has_one :address

## addressテーブル

| Column                    | Type          | Options    |
| ------------------------- | ------------- | ---------- |
| postal-code               | string        | null false |
| prefecture                | string        | null false |
| city                      | string        | null false |
| addresses                 | integer       | null false |
| building-number           | integer       |            |
| phone-number              | string        | null false |
| order                     | references    |            |

### Association

  belongs_to :order
# テーブル設計

## users テーブル

| Column             | Type    | Options    |
| ------------------ | ------  | ---------- |
| nickname           | string  | null false |
| email              | string  | null false |
| password           | string  | null false |
| encrypted_password | string  | null false |
| name full-width    | string  | null false |
| kana full-width    | string  | null false |
| birthday           | integer | null false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column       | Type       | Options    |
| ------------ | ---------- | --------   |
| name         | string     | null false |
| category     | text       | null false |
| price        | integer    | null false |
| seller       | text       | null false |
| image        | ActiveStorageで実装      |
| user         | references |            |

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
  belong_to :item
  has_one :address

## addressテーブル

| Column                    | Type          | Options    |
| ------------------------- | ------------- | ---------- |
| item-shipping-fee-status  | text          | null false |
| item-prefecture           | text          | null false |
| postal-code               | integer       | null false |
| prefecture                | string        | null false |
| city                      | string        | null false |
| addresses                 | integer       | null false |
| building-number           | integer       | null false |
| phone-number              | integer       | null false |
| order                     | references    |            |

### Association

  belongs_to :order
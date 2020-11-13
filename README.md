# テーブル設計

## users テーブル

| Column          | Type    | Options   |
| ----------      | ------  | --------- |
| nickname        | string  | NOT NILL |
| email           | string  | NOT NILL |
| password        | string  | NOT NILL |
| name full-width | string  | NOT NILL |
| kana full-width | string  | NOT NILL |
| birthday        | integer | NOT NILL |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column       | Type       | Options  |
| ------------ | ---------- | -------- |
| product name | string     | NOT NILL |
| category     | text       | NOT NILL |
| price        | integer    | NOT NILL |
| seller       | text       | NOT NILL |
| image        | ActiveStorageで実装    |
| user_id      | references |          |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column                 | Type       | Options  |
| ---------------------- | ---------- | -------- |
| buy-item-info          | text       | NOT NILL |
| item-payment           | integer    | NOT NILL |
| credit-card-form       | text       | NOT NILL |
| shipping-address-form  | text       | NOT NILL |
| user_id                | references |          |
| items_id               | references |          |

### Association

  belongs_to :user
  has_one :item
  belongs_to :address

## addressテーブル

| Column                    | Type          | Options  |
| ------------------------- | ------------- | -------- |
| item-shipping-fee-status  | text          | NOT NILL |
| item-prefecture           | text          | NOT NILL |
| item-scheduled-delivery   | text          | NOT NILL |
| user                      | references    |          |
| prototype                 | references    |          |

### Association

  belongs_to :order
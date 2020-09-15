# テーブル設計

## users テーブル

| Column            | Type   | Options       |
| ----------------- | ------ | -----------   |
| nickname          | string | null: false   |
| email             | string | null: false   |
| password          | string | null: false   |
| birthday          | date   | null: false   |
| last_name         | string | null: false   |
| first_name        | string | null: false   |
| last_name_kana    | string | null: false   |
| first_name_kana   | string | null: false   |



### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type     | Options                        |
| ----------------- | -------- | ------------------------------ |
| name              | string   | null: false                    |
| category_id       | integer  | null: false                    |
| price             | integer  | null: false                    |
| text              | text     | null: false                    |
| status_id         | integer  | null: false                    |
| area_id           | integer  | null: false                    |
| day_standard_id   | integer  | null: false                    |
| delivery_fee_id   | integer  | null: false                    |
| user_id           | integer  | null: false, foreign_key: true |
### Association

- belongs_to : user
- has_one : purchase 


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| area_id       | integer    | null: false                    | 
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| build_name    | string     |                                |
| phone_call    | string     | null: false                    |
| order_id      | integer    | null: false, foreign_key: true |
### Association

- belongs_to :order



## order テーブル
| Column     | Type     | Options                        |
| --------   | ------   | ------------------------------ |
| user_id    | integer  | null: false, foreign_key: true | 
| item_id    | integer  | null: false, foreign_key: true | 
### Association
has_one :address
belongs_to : user
belongs_to : item


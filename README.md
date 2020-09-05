# テーブル設計

## users テーブル

| Column            | Type   | Options       |
| ----------------- | ------ | -----------   |
| nickname          | string | null: false   |
| email             | string | null: false   |
| password          | string | null: false   |
| birthday          | datetime | null: false |
| last_name         | string | null: false   |
| first_name        | string | null: false   |
| last_name_kana    | string | null: false   |
| first_name_kana   | string | null: false   |



### Association

- has_many :item
- has_one :purchase

## items テーブル

| Column            | Type     | Options                        |
| ----------------- | -------- | ------------------------------ |
| name              | string   | null: false                    |
| category          | string   | null: false                    |
| price             | integer  | null: false                    |
| exhibitor         | string   | null: false                    |
| status            | string   | null: false                    |
| area              | integer  | null: false                    | 
| day_standard      | datetime | null: false                    |
| user_id           |integer   | null: false, foreign_key: true |
| address_id        |integer   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address

## addresses テーブル

| Column       | Type       | Options     |
| ------       | ---------- | ----------- |
| zip          | integer    | null: false |
| prefecture   | string     | null: false | 
| city         | string     | null: false |
| address      | string     | null: false |
| build-name   | string     | null: false |
| phone-call   | integer    | null: false |
### Association

- has_many :items
- has_one :purchase



## purchases テーブル
| Column     | Type     | Options     |
| --------   | ------   | ----------- |
| card_number| integer  | null: false |
| x_day      | datetime | null: false |
| cvc        | integer  | null: false |

### Association

- has_one :user
- has_one :address
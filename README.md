# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |
| gender_id          | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| review             | references | foreign_key: true              |

### Association
- has_many :reviews
- has_one :order



## owners テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |
| post_code          | string  | null: false               |
| area_id            | integer | null: false               |
| city               | string  | null: false               |
| address            | string  | null: false               |
| building_name      | string  |                           |
| phone_number       | string  | null: false               |

### Association
- has_many :shops


## shops テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| shop_name   | string     | null: false                    |
| address     | text       | null: false                    |
| phone       | integer    | null: false                    |
| open_close  | integer    | null: false                    |
| drink       | integer    | null: false                    |
| category_id | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| owner       | references | null: false, foreign_key: true |
| review      | references | foreign_key: true              |

### Association
- belongs_to :owner
- has_many :reviews




## reviews テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | text       | null: false                    |
| review    | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| shop      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shop



##  orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user

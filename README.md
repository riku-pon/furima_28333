# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| mail_address         | string | null: false |
| password             | string | null: false |
| confirm_password     | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| phonetic_family_name | string | null: false |
| phonetic_first_name  | string | null: false |
| birthday             | date   | null: false |

### Association

 - has_many :items
 - has_many :addresses
 - has_one :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category            | integer    | null: false                    |
| status              | integer    | null: false                    |
| shipping_charges    | integer    | null: false                    |
| shipping_region     | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
| selling_price       | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

 - belongs_to :user
 - has_one :address

### orders テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| user_id    | integer | null: false |
| item_id    | integer | null: false |

## Association

 - belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |
| phone_number  | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

 - belongs_to :item

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

## users　テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| mail_address     | string | null: false |
| password         | string | null: false |
| confirm_password | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| birthday_year    | string | null: false |
| birthday_month   | string | null: false |
| birthday_day     | string | null: false |

### Association

 - has_many :items
 - has_many :deliverys
 - has_many :card_numbers

## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| image_url        | string  | null: false |
| name             | text    | null: false |
| description      | text    | null: false |
| category         | string  | null: false |
| status           | string  | null: false |
| shipping_charges | string  | null: false |
| shipping_region  | string  | null: false |
| selling_price    | integer | null: false |

### Association

 - belongs_to :users

## card_numbers テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| expiration_month | integer | null: false |
| expiration_year  | integer | null: false |
| security_code    | integer | null: false |

### Association

 - belongs_to :users

## deliverys テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |
| phone_number  | integer | null: false |

### Association

 - belongs_to :users
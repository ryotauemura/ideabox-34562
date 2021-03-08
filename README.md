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

users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birthday           | date       | null: false               |

has_many :idea
has_many :comments


ideas テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| title               | string      | null: false       |
| purpose             | string      | null: false       | 
| description         | text        | null: false       |
| category_id         | integer     | null: false       |
| user                | references  | foreign_key: true |
|                     |             |                   |
|                     |             |                   |
|                     |             |                   |

belongs_to :user
has_many   :comment

comments テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| text                | text        | null: false       |
| user                | references  | foreign_key: true |
| idea                | references  | foreign_key: true |
|                     |             |                   |
|                     |             |                   |

belongs_to :user
belongs_to :idea
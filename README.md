# IdeaBox

[![Image from Gyazo](https://i.gyazo.com/3817e1540354d09103b001ef11621693.jpg)](https://gyazo.com/3817e1540354d09103b001ef11621693)

## 概要

ふと思いついたアイディアを投稿し閲覧できるアプリケーションです。仕事や生活で役立つアイディアを考えた時に
、それをみてもらうことでより良いアイディアにできたり、企画の参考になるアイディアを見つけることができる

 URL  https://ideabox-34562.herokuapp.com/

## Basic認証     
  ID    final

  Pass  7777

## テスト用アカウント  
  メールアドレス  test@test.com

  パスワード     test00

## 利用方法

・トップページから新規登録・ログイン

・一覧画面へ遷移する

・新規投稿は右上の投稿するをクリック

・それぞれ指定した要素を入力して投稿ボタンを押すと一覧ページへ遷移して追加される

・一覧画面から１つの投稿を選択 → 投稿詳細画面へ遷移する

・投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる

・投稿詳細画面からコメントができる

・投稿詳細画面からいいねできる

## 課題解決

アイディアを考えたが自信を持てない人にコメントで助言してもらい応援してもらえる
考えてはみたが自分で実現が難しいアイディアを誰かに実現してもらえる

## 洗い出した要件

・考えたアイディアを保存しておけるプラットフォームがほしい

・自分の考え方だけでなく、他者の思想も参考にしたい

・仕事の企画などで参考になる情報がほしい

・こんな〜があったらいいのにというアイディアを発信できる場所がほしい

## ローカルでの動作方法

% git clone https://github.com/ryotauemura/ideabox-34562

% cd ideabox-34562

% bundle install

% rails db:create

% rails db:migrate

% rails s

 ⇨ http://localhost:3000

 ## 開発環境

・VScode

・RUby 2.6.5

・Rails 6.0.0

・mysql2 0.4.4

・javaScript 

## データベース設計

・users テーブル

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

has_many :likes, dependent: :destroy

has_many :like_ideas, through: :likes, source: :idea

・ideas テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| title               | string      | null: false       |
| purpose             | string      | null: false       | 
| description         | text        | null: false       |
| category_id         | integer     | null: false       |
| user                | references  | foreign_key: true |
|                     |             |                   |

belongs_to :user

has_many   :comment

has_many :likes, dependent: :destroy

has_many :liking_users, through: :likes, source: :user

・comments テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| text                | text        | null: false       |
| user                | references  | foreign_key: true |
| idea                | references  | foreign_key: true |
|                     |             |                   |

belongs_to :user

belongs_to :idea

・likes テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| user_id             | integer     |                   |
| idea_id             | integer  |                   |
|                     |             |                   |

belongs_to :idea, counter_cache: :likes_count

belongs_to :user

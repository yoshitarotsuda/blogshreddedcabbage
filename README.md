# README

# BlogSreddedCabbage
個人用のブログです。
WordPressやブログサイトを利用せず、ブログ作成機能というものの構造把握のために一から作成を試みました。

# DB設計

## usersテーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |

### Association

- has_many : articles
- has_many : images

## articlesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| content            | text       | null: false                   |
| user               | references | null: false, foreign_key:true |

### Association
- has_many :articles_tags

## articles_tagsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| content            | text       | null: false                   |
| user               | references | null: false, foreign_key:true |

### Association
- belongs_to :article
- belongs_to :tag

## tagsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| tag_name           | string     | null: false                   |

### Association
- has_many :articles_tags

## commentsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| comment            | text       | null: false                   |
| article            | references | null: false, foreign_key:true |
| cookie_id          | string     | null: false,                  |

### Association

- belongs_to :article


## likesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| like_id            | integer    | null: false                   |
| article            | references | null: false, foreign_key:true |
| cookie_id          | string     | null: false,                  |

### Association

- belongs_to :article
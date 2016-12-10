###データ設計構想の確認をお願いします


- アカウントの登録情報の管理：usersテーブル
- チャットのグループの管理：groupsテーブル
- チャットの内容の管理：messagesテーブル


**ユーザーとグループの関係が多対多であるので，中間テーブル(relations)を使う**

messagesテーブル


| column      | type     |
|:-----------:|:--------:|
| body        |  text    |
| image       |  string  |
| group_id    |  integer |
| user_id     |  integer |


usersテーブル
※deviseに従う


| column      | type     | remarks  |
|:-----------:|:--------:|:--------:|
| name        |  string  | null :false |
| email       |  string  | null :false, unique :true|
| password    |  integer | null :false  |


groupsテーブル


| column      | type     |
|:-----------:|:--------:|
| group_name  |  string  |


relationsテーブル


| column      | type     |
|:-----------:|:--------:|
| user_id     |  integer |
| group_id    |  integer |


```ruby:user.rb
class User < ActiveRecord::Base

  has_many :relations
  has_many :groups, through: :relations
```

```ruby:group.rb
class Group < ActiveRecord::Base

  has_many :relations
  has_many :users, through: :relations
```

```ruby:relation.rb
class Relation < ActiveRecord::Base

  belongs_to :users
  belongs_to :groups
```

```ruby:message.rb
class Message < ActiveRecord::Base

  belongs_to :users
  belongs_to :groups
```

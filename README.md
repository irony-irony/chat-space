###データ設計構想の確認をお願いします


- アカウントの登録情報の管理：usersテーブル
- チャットのグループの管理：groupsテーブル
- チャットの内容の管理：messagesテーブル


**ユーザーとグループの関係が多対多であるので，中間テーブル(relations)を使う**

-  messagesテーブル

```ruby:migrationファイル
t.text :body, null: false
t.string :image
t.references :user, foreign_key: true, null: false
t.references :group, foreign_key: true, null: false
t.timestamps null: false
```


```ruby:message.rb
class Message < ActiveRecord::Base

  belongs_to :users
  belongs_to :groups
```



- usersテーブル


```ruby:migrationファイル
t.string :name, null :false, unique: true
add_index :users, :name
t.string :email, null :false, unique: true
add_index :users, :email
t.timestamps :null false
```

```ruby:user.rb
class User < ActiveRecord::Base

  has_many :relations
  has_many :groups, through: :relations
  has_many :messages
```



- groupsテーブル

```ruby:migrationファイル
t.string :group_name, null: false
```

```ruby:group.rb
class Group < ActiveRecord::Base

  has_many :relations
  has_many :users, through: :relations
  has_many :messages
```



- relationsテーブル


```ruby:migrationファイル
t.references :user, foreign_key: true, null: false
t.references :group, foreign_key: true, null: false
```


```ruby:relation.rb
class Relation < ActiveRecord::Base

  belongs_to :users
  belongs_to :groups
```



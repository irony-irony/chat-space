class Group < ApplicationRecord
  validates :group_name, presence: true
  validates :user_ids, presence: true
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
end


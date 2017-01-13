class Message < ApplicationRecord
  validates :user_id, :group_id, presence: true
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImagesUploader
end


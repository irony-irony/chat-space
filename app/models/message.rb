class Message < ApplicationRecord
  validates :user_id, :group_id, presence: true
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImagesUploader

  def api_json
    {
      name: user.name,
      body: body,
      time: created_at.to_formatted_s(:datetime),
      image: image.url
    }
  end
end


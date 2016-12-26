require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body. image, user_id, group_id, created_at and updated_at " do
     message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    it "is valid without any image" do
     message = build(:message, image: nil)
      message.valid?
      expect(message).to be_valid
    end
  end
end

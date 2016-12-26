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

    it "is invalid without any body" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include("本文が入力されていません")
    end

    it "is invalid without any user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include("user_idがありません")
    end

    it "is invalid without any group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include("group_idがありません")
    end
  end
end

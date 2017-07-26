require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without a content" do #メッセージも画像もないと保存できない
      message = Message.new(content: "", image: "", user_id: "000", group_id: "000")
      message.valid?
      expect(message.errors[:content]).to include("メッセージを入力してください")
    end
    it "is invalid without a user_id" do #user_idがないと保存できない
      message = Message.new(content: "aaa", image: "aaa.jpg", user_id: "", group_id: "000")
      message.valid?
      expect(message.errors[:user_id]).to include("不正な送信です")
    end
    it "is invalid without a group_id" do #group_idがないと保存できない
      message = Message.new(content: "aaa", image: "aaa.jpg", user_id: "000", group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("不正な送信です")
    end
  end
end

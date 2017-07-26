require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without a content" do #メッセージも画像もないと保存できない
      message = Message.new(content: "", image: "", user_id: "000", group_id: "000")
      message.valid?
      expect(message.errors[:content]).to include("メッセージを入力してください")
    end
  end
end

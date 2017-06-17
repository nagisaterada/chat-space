class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def create
    @message = Message.new(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:)
  end


end


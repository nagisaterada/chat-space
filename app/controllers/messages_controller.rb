class MessagesController < ApplicationController

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: :index

  def index
    @groups = current_user.groups
    @group = Group.find(3)
    @message = Message.new
    @messages = @group.messages(:content)
    @users = @group.users.name
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      redirect_to group_messages_url(3), notice: 'メッセージを入力しました'
    else
      flash.now[:alert] = 'メッセ―ジを入力してください'
      render :new
    end
  end

  private

  def create_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end


end


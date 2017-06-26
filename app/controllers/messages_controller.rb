class MessagesController < ApplicationController

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: :index

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
  end

  def create
    @message = current_user.messages.new(create_params)
    if @message.save
      redirect_to group_messages_url(params[:group_id]), notice: 'メッセージを入力しました'
    else
      flash.now[:alert] = 'メッセ―ジを入力してください'
      render :new
    end
  end

  private

  def create_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end


end


class GroupsController < ApplicationController

  before_action :authenticate_user!, alert: "ログインしてください"
  before_action :find_group, only:[:edit, :update]


  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to group_messages_url(group), notice: 'グループを作成しました'
    else
      flash.now[:alert] = 'グループ名を入力してください'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update

  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def find_group
    @group = Group.find(params[:id])
  end


end


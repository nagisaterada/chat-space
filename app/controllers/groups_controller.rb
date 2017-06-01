class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def groups_params
    params.require(:group).permit(:name)
  end

end


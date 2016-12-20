class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path, notice: "グループが保存されました"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end

end


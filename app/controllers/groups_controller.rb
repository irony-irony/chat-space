class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
   user = User.find(current_user.id)
   @groups = user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.errors.any?
      render :new
    else
      redirect_to groups_path, notice: "グループが作成されました"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to group_messages_path(group.id), notice: "グループが更新されました"
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end

end




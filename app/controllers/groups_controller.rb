class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :specify_group, only: %i(edit update)

  def index
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
  end

  def update
    @group.update(group_params)
    if @group.errors.any?
      render :edit
    else
      redirect_to group_messages_path(@group.id), notice: "グループが更新されました"
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end
  def specify_group
    @group = Group.find(params[:id])
  end
end


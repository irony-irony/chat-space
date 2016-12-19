class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def new
    @group = Group.new()
    @group.group_users.build
  end

  def create
    Group.create(group_params)
    redirect_to controller: :messages, action: :index
  end

  def edit

  end

  def update

  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end

end


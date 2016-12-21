class MessagesController < ApplicationController
  def index
    user = User.find(current_user.id)
    @groups = user.groups
    @group = Group.find(params[:group_id])
  end
end


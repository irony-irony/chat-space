class MessagesController < ApplicationController
  def index
    user = User.find(current_user.id)
    @groups = user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to group_messages_path(params[:group_id])
    if @message.body.empty?
      flash[:alert] = "何か入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end


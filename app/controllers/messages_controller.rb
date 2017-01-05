class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to group_messages_path(params[:group_id])
    if @message.save
      flash[:notice] = "メッセージが送信されました"
    else
      flash[:alert] = "空欄のままでは送信できません"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end


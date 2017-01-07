class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new (message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージが送信されました" }
        format.json { render json: @message}
      end
    else
      respond_to do |format|
        format.html { redirect_to group_messages_path, alert: "メッセージが送信できませんでした" }
        format.json { render json: { alert: 'error'} }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end


class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.includes(:user).where(group_id: params[:group_id])

    respond_to do|format|
      format.html { }
      format.json {

        msg_array = []
        @messages.each do |message|
          msg_array << {
          name: message.user.name,
          time: message.created_at.to_formatted_s(:datetime),
          body: message.body,
          image: message.image.url
        } end
        render json: { db: msg_array }
      }
    end
  end

  def create
    @message = Message.new (message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json { render json: @message.api_json }
      end
    else
      redirect_to group_messages_path, alert: "メッセージが送信できませんでした"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end


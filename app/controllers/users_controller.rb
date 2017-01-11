class UsersController < ApplicationController
  def search
    @users = User.where('name LIKE(?)', "%#{params[:name]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.json {render json: @users}
    end
  end
end

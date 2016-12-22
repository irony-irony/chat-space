class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_paramaters, if: :devise_controller?

  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
  end


  def after_sign_in_path_for(resources)#サインした後のリダイレクと先の指定
    '/groups/'
  end

  def after_sign_out_path_for(resource) #サインアウトした後のリダイレクト先の指定
    '/users/sign_in'
  end
end



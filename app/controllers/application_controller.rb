class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :set_activity, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  def current_user 
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id] 
  end

  helper_method :current_user  

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

end

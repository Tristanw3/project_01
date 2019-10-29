class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully Logged In!'
    else
      flash[:warning] = "Invalid Username or Password"
      redirect_to '/n'
    end
  end 

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully Logged Out!"
    redirect_to '/'
  end

end

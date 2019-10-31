class UsersController < ApplicationController
  def new
    if current_user
      redirect_to '/courses'
    end
  end

  def create
    @user = User.new(
      user_name: params[:user_name],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Object successfully created user"
      redirect_to '/'
    else
      flash[:warning] = "Something went wrong"
      redirect_to '/signup'
    end

  end

  # private
  # def user_params
  #   params.require(:user).permit(:user_name, :name, :email, :password, :password_confirmation)
  # end

end

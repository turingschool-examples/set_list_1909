class UsersController < ApplicationController
  def new
  end

  def create
    new_user = User.create(user_params)
    flash[:success] = "Welcome, #{new_user.username}!"
    session[:user_id] = new_user.id
    redirect_to '/'
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

    def user_params
      params.permit(:username, :password)
    end
end

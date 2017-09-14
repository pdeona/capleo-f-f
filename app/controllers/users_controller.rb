class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      render 'show'
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  private

  # only whitelist params, scary internet, etc.
  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end

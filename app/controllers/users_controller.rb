class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user_params = params[:user]
    @user = User.new(name: user_params[:name], email: user_params[:email],
                     password: user_params[:password],
                     password_confirmation: user_params[:password_confirmation])
    if @user.save
      render 'show'
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end
end

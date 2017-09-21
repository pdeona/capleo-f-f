class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @cart = Cart.find_by user_id: @user.id
    @playlists = Playlist.order(created_at: :desc)
  end

  def create
    @user = User.new(user_params)
    if @user.save && cart = Cart.create(user_id: @user.id)
      redirect_to products_path, notice: 'Sign Up Successful'
    else
      render 'new', error: 'Sign up failed, try again.'
    end
  end

  def index
    # @users = User.all
  end

  private

  # only whitelist params, scary internet, etc.
  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end

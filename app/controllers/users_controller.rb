class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @cart = Cart.new(user_id: @user.id)
    respond_to do |format|
      if @user.save && @cart.save
        log_in @user
        render products_path, notice: 'Sign Up Successful'
      else
        render 'signup', error: 'Sign up failed, try again.'
      end
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

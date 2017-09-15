class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_email)
    if user && user.authenticate(session_pw)
      log_in user
      redirect_to user_path(user), :notice => "Log in successful"
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path, :notice => 'Logged out successfully.'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def session_email
    params[:session][:email].downcase
  end

  def session_pw
    params[:session][:password]
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  before_action :current_user, :current_cart

end

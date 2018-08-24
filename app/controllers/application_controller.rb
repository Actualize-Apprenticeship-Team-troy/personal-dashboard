class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_valid_user!

  def current_user
    if !session[:user_id].blank?
      @user ||= User.find(session[:user_id])
    end
  end

  private
 
    def require_valid_user!
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
end

class SessionsController < ApplicationController
  skip_before_action :require_valid_user!, except: [:destroy]

  def new
   # @session = Session.new
  end

  def create
    reset_session
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Welcome back!'
      redirect_to (home_path)
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to (login_path)
    end
  end

  def destroy
    reset_session
    flash[:success] = 'You have logged out'
    redirect_to login_path
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

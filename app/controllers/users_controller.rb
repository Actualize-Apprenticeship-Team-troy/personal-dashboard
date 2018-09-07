class UsersController < ApplicationController
  skip_before_action :require_valid_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up"
      redirect_to (home_path)
    else
      flash[:warning] = 'Form is invalid'
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username,
             :email,
             :password)

    end
end

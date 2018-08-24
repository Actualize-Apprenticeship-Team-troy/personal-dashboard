class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up"
      redirect_to '/'
    else
      flash[:warning] = 'Form is invalid'
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username,
             :email,
             :password)

    end
end

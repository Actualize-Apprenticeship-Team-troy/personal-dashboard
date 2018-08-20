class UsersController < ApplicationController
  def new
    @testing = "This is a test"
  end

  def create
   user = User.new(user_params)
    if user.save
      flash[:success] = "Successfully signed up"
      redirect_to '/'
    else
      flash[:warning] = 'Form is invalid'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
             :email,
             :password)

  end
end

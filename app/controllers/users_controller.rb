class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(username: Faker::Name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
    if user.save
      flash[:success] = "Successfully signed up"
      redirect_to '/'
    else
      flash[:warning] = 'Form is invalid'
    end
  end
end

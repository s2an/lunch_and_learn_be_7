class UsersController < ApplicationController

  def create 
    user = User.create(user_params)
    user.save!
      render json: UserSerializer.new(user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
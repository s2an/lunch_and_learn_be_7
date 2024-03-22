class Api::V1::SessionsController < ApplicationController

  # "Create" a login, aka "log the user in"
  def create
    user = User.find_by(email: params[:email])
    # user = User.find_by(email: params[:current_user][:email])

    if user && user.authenticate(params[:password])
    # if user && user.authenticate(params[:current_user][:password])

      session = user.id
      # session[:current_user_id] = user.id
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: "invaild user name or password" }, status: 401
    end
  end

end

class Api::V1::SessionsController < ApplicationController

  # "Create" a login, aka "log the user in"
  def create
    # require "pry"; binding.pry
    user = User.find_by(email: params[:current_user][:email])

    if user && user.authenticate(params[:current_user][:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: "invaild user name or password" }, status: 401
    end
  end

  # => #<ActionController::Parameters {"current_user"=>{"email"=>"goodboy@ruffruff.com", "password"=>"treats4lyf"}, "controller"=>"api/v1/sessions", "action"=>"create", "session"=>{"current_user"=>{"email"=>"goodboy@ruffruff.com", "password"=>"treats4lyf"}}} permitted: false>
  # def create
  #   @user = User.find_by(email: params[:user][:email])
  #   if @user.present? && @user.authenticate(params[:user][:password])
  #     session[:user_id] = @user.id
  #     redirect_to root_path, flash: { success: 'Logged in successfully' }
  #   else
  #     render :new
  #   end
  # end
end

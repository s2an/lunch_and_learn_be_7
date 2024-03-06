class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response 
  rescue_from ActionController::BadRequest, with: :bad_request_response

private

  # when AR model fail upon saving (save, create, update)
  def invalid_record_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 422))
      .serialize_json, status: :unprocessable_entity
  end
 
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end

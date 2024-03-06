class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response 
  rescue_from ActionController::BadRequest, with: :bad_request_response

private

  # when AR model fail upon saving (save, create, update)
  def invalid_record_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 422))
      .serialize_json, status: :unprocessable_entity
  end
end

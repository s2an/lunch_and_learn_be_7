require "rails_helper"

RSpec.describe "Api::V1::Users", type: :request do
  it "checks for a response"  do
    new_user_data = ( {name: "Odell", email: "test@test.com", password: "treats4lyf", password_confirmation: "treats4lyf"} )
    
    post "/api/v1/users", headers: {"Content-Type" => "application/json"}, params: JSON.generate(user: new_user_data)
    
    # require "pry"; binding.pry
    expect(response).to have_http_status(201)
    expect(User.last.name).to eq("Odell")   
    expect(User.last.email).to eq("test@test.com")   
    expect(User.last.password_digest).to_not eq("treats4lyf")   
    # expect(User.last.api_key).to eq("[FILTERED]")   
  end

end
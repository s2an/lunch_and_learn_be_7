require "rails_helper"

RSpec.describe "Api::V1::Users", type: :request do
  it "checks for a response"  do
    new_user_data = ( {name: "Odell", email: "test@test.com", password: "treats4lyf"} )
    
    post "/api/v1/users", headers: {"Content-Type" => "application/json"}, params: JSON.generate(user: new_user_data)
    
    require "pry"; binding.pry
    expect(response).to have_http_status(201)
    expect(User.name).to eq("Odell")   
    expect(User.email).to eq("test@test.com")   
    expect(User.password_digest).to eq("[FILTERED]")   
    # expect(User.api_key).to eq("[FILTERED]")   
  end

end
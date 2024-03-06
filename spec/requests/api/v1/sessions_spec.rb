require "rails_helper"

RSpec.describe "Api::V1::Sessions", type: :request do
  it "checks the response and it is good"  do
    new_user_data = ( {name: "Odell", email: "test@test.com", password: "treats4lyf"} )
    post "/api/v1/users", headers: {"Content-Type" => "application/json"}, params: JSON.generate(user: new_user_data)
    
    session = ( {email: "test@test.com", password: "treats4lyf"} )
    post "/api/v1/sessions", headers: {"Content-Type" => "application/json"}, params: JSON.generate(current_user: session)
    
    # require "pry"; binding.pry
    expect(response).to have_http_status(201)

  end

  it "checks the response and it is invalid" do
    new_user_data = { name: "Odell", email: "test@test.com", password: "treats4lyf" }
    post "/api/v1/users", headers: { "Content-Type" => "application/json" }, params: JSON.generate(user: new_user_data)

    invalid_session = { email: "goodboy@ruffruff.com", password: "n0bueano" }
    post "/api/v1/sessions", headers: { "Content-Type" => "application/json" }, params: JSON.generate(current_user: invalid_session)

    expect(response).to have_http_status(401)
  end
end
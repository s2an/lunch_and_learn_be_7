require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password_digest)}
  end
  
  it "generates an API key" do
    user = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
    
    expect(user).to have_attribute(:api_key)
    # expect(user.api_key.status_code).to eq(201)
    #flash message <--feature
  end

  it "forces a secure password" do
    user = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "password123", password_confirmation: "password123")
    
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq("password123")
  end

  #feature
  it "has unique email" do
    user_1 = User.create(name: "Odell", email: "double@double.com", password: "treats4lyf", password_confirmation: "treats4lyf")
    user_2 = User.create(name: "Adele", email: "double@double.com", password: "sing4lyf", password_confirmation: "sing4lyf")
    
    expect(user_1).to be_an_instance_of(User)
    expect(user_2).to_not be_an_instance_of(User)
    # flash message!

    # Doesn't have a created_at or id...
    # 1) User has unique email
    # Failure/Error: expect(user_2).to_not be_an_instance_of(User)
    #   expected #<User id: nil, name: "Adele", email: "double@double.com", password_digest: [FILTERED], api_key: nil, created_at: nil, updated_at: nil> not to be an instance of User
    # # ./spec/models/user_spec.rb:31:in `block (2 levels) in <top (required)>'
  end

  #feature
  it "forces matching passwords" do
    user = User.create(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "n0treats4u")
    
    expect(user).to be_an_instance_of(User)
    expect(user).to_not have_attribute(:password)
    # flash message!
  end
end
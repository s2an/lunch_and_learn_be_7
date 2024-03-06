require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password_digest)}
  end
  
  it "generates an API key" do
    user = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "password123")
    
    expect(user).to have(:api_key)
    expect(user.api_key.status_code).to eq(201)
    #flash message <--feature
  end

  it "forces a secure password" do
    user = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "password123")
    
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq("password123")
  end

  #feature
  xit "has unique email" do
    user_1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf")
    user_2 = User.create!(name: "Adele", email: "goodboy@ruffruff.com", password: "sing4lyf")
    
    expect(user_1).to be_an_instance_of(User)
    expect(user_2).to_not be_an_instance_of(User)
    # flash message!
  end

  #feature
  xit "forces matching passwords" do
    user_1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "n0treats4u")
    
    expect(user_1).to be_an_instance_of(User)
    expect(user).to_not have_attribute(:password)
    # flash message!
  end
end
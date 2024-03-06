class UserSerializer
  include JSONAPI::Serializer

  set_type :user

  attributes :name, :email, :api_keys, :api_key
  
end
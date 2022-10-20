require "rails_helper"

RSpec.describe "User Service" do

  describe "create user" do
    it "returns an error for duplicate user" do
      user_data_hash = {
        email: "nickjacobsssssss@gmail.com",
        password: "password",
        password_confirmation: "password"
      }

      user = UserService.create_user(user_data_hash)
      expect(user).to include :error
      expect(user[:error]).to eq("Email has already been taken")
    end
  end


  describe "login user" do
    it "returns user data when login is successful" do
      user_data_hash = {
        email: "nickjacobsssssss@gmail.com",
        password: "password"
      }

      user = UserService.login_user(user_data_hash)[:data][:attributes]
      expect(user[:email]).to eq("nickjacobsssssss@gmail.com")
      expect(user[:api_key]).to eq("cea56b53d06c81d6dc03803421eb30ed")
    end

    it "returns an error when credentials are invalid" do
      user_data_hash = {
        email: "nickjacobs@gmail.com",
        password: "password"
      }

      user = UserService.login_user(user_data_hash)
      expect(user[:error]).to eq("Invalid Credentials, Try Again")
    end
  end
end

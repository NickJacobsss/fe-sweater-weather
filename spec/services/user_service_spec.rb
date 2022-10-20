require "rails_helper"

RSpec.describe "User Service" do

  it "returns an error for duplicate user" do
    user_data_hash = {
      email: "nickjacobsssssss@gmail.com",
      password: "password",
      password_confirmation: "password"
    }

    user = UserService.create_user(user_data_hash)
      binding.pry
    expect(user).to include :error
    expect(user[:error]).to eq("Email has already been taken")
  end

end

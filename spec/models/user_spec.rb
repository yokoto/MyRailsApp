require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, password, and password_confirmation" do
    user = User.new(
      name: "山田くん",
      email: "foo@bar",
      password: "yamada-no-password-desu",
      password_confirmation: "yamada-no-password-desu",
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "Michael Sandel",
      email: "test@example.com",
      password: "justice",
      password_confirmation: "justice",
    )
    user = User.new(
      name: "Andrew Ng",
      email: "test@example.com",
      password: "coursera",
      password_confirmation: "coursera",
    )
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end
end

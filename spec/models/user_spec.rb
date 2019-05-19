require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { create(:user, email: "test@example.com") }
  let(:user2) { build(:user, name: "") }
  let(:user3) { build(:user, email: "test@example.com") }

  it { expect(user1).to be_valid }

  it {
    user2.valid?
    expect(user2.errors[:name]).to include("が入力されていません。")
  }

  it {
    user3.valid?
    expect(user3.errors[:email]).to include("は既に使用されています。")
  }
end

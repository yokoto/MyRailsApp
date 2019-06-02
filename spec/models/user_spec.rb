# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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

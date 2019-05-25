require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post1) { build(:post) }
  let(:post2) { build(:post, :no_content) }

  it {
    post1 = build(:post)
    expect(post1).to be_valid
  }

  it {
    post2.valid?
    expect(post2.errors.messages[:content]).to include("が入力されていません。")
  }
end

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "これは#{n}番目の私の投稿ですよ。" }
    association :user

    trait :no_content do
      content nil
    end
  end
end

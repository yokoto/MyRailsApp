FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "これは#{n}番目の私の投稿ですよ。" }
    association :user

    trait :no_content do
      content nil
    end
  end
end

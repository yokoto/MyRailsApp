FactoryBot.define do
  factory :user do
    name "山田くん"
    sequence(:email)  { |n| "foo#{n}@bar.com" }
    password "yamada-no-password-desu"
    password_confirmation "yamada-no-password-desu"
  end
end

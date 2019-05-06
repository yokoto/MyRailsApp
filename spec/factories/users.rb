FactoryBot.define do
  factory :user do
    name "山田くん"
    email "foo@bar.com"
    password "yamada-no-password-desu"
    password_confirmation "yamada-no-password-desu"

    factory :other_user do
      name "佐藤さん"
      email "sato@dayo.com"
      password "sato-no-password-dayo"
      password_confirmation "sato-no-password-dayo"
    end
  end
end

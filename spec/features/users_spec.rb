require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "user login" do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(page).to have_content 'ログインしました。'
  end

  scenario "invalid user login" do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in "メールアドレス", with: ""
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(page).not_to have_content 'ログインしました。'
  end

  scenario "user signup" do
    user = FactoryBot.build(:user)
    visit new_user_registration_path
    click_on "アカウント登録"
    fill_in  "名前", with: user.name
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "確認用パスワード", with: user.password_confirmation
    click_button "アカウント登録"
    expect(page).to have_content 'アカウント登録が完了しました。'

    click_on "ログアウト"
    expect(page).to have_content 'アカウント登録もしくはログインしてください。'
  end

  scenario "invalid user signup" do
    user = FactoryBot.build(:user)
    visit new_user_registration_path
    click_on "アカウント登録"
    fill_in  "名前", with: ""
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "確認用パスワード", with: ""
    click_button "アカウント登録"
    expect(page).not_to have_content 'アカウント登録が完了しました。'
  end
end

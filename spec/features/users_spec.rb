require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature 'login and logout' do
    let!(:user) { create(:user) }
    before { visit new_user_session_path }

    scenario "login" do
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
      expect(page).to have_selector '.alert', text: 'ログインしました。'
    end

    scenario "invalid login" do
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: user.password
      click_button "ログイン"
      expect(page).not_to have_content 'ログインしました。'
    end
  end

  feature 'signup and signout' do
    let!(:user) { build(:user) }
    before { visit new_user_registration_path }

    scenario "valid signup information and signout" do
      click_on "アカウント登録"
      fill_in  "名前", with: user.name
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      fill_in "確認用パスワード", with: user.password_confirmation
      expect do
        click_button "アカウント登録"
      end.to change(User, :count).by(1)
      expect(page).to have_selector '.alert', text: 'アカウント登録が完了しました。'
      click_on "ログアウト"
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end

    scenario "invalid signup" do
      visit new_user_registration_path
      click_on "アカウント登録"
      fill_in  "名前", with: ""
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      fill_in "確認用パスワード", with: ""
      expect do
        click_button "アカウント登録"
      end.to_not change(User, :count)
      expect(page).not_to have_content 'アカウント登録が完了しました。'
    end
  end
end

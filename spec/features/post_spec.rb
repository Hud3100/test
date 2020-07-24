require 'rails_helper'

RSpec.feature '総合テスト' do
  let!(:user){ create(:user) }
  let!(:anotheruser){ create(:user, email: 'another@another.com') }
  background do
  end

  scenario '投稿し、他ユーザーがコメントする' do
    act_as user do
      fill_in 'タイトル', with: 'Hello World'
      fill_in '内容', with: 'こんにちは'
      click_on '投稿する'
      expect(page).to have_content 'こんにちは'
    end
    act_as anotheruser do
      visit root_path
      fill_in 'comment', with: 'こんばんわ'
      click_on 'コメントする'
      expect(page).to have_content 'こんばんわ'
    end
  end

  scenario '投稿内容が入力されていなければエラーメッセージを表示する' do
    login(user)
    fill_in 'タイトル', with: 'Hello World'
    fill_in '内容', with: ''
    click_on '投稿する'
    expect(page).to have_content "Content can't be blank"
  end

  scenario '投稿内容が検索にヒットする' do
    act_as user do
      fill_in 'タイトル', with: 'Hello World'
      fill_in '内容', with: 'こんにちは'
      click_on '投稿する'
      expect(page).to have_content 'こんにちは'
    end
    act_as anotheruser do
      fill_in 'search-form', with: 'こんにちは'
      click_on '検索'
      expect(page).to have_content 'こんにちは'
    end
  end
end
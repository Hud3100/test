require 'rails_helper'

RSpec.feature '投稿' do
  let!(:user){ create(:user) }
  background do
  end

  scenario '投稿する' do
    login(user)
    expect(user).to be_valid
    fill_in 'タイトル', with: 'Hello World'
    fill_in '内容', with: 'こんにちは'
    click_on '投稿する'
    expect(page).to have_content 'こんにちは'
  end
end
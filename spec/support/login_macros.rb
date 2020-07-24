module LoginMacros
  def login(user)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'Log in'
  end

  def logout
    click_link 'ログアウト'
  end

  def act_as(user)
    login user
    yield
    logout
  end
end
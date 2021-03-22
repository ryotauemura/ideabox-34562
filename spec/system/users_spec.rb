require 'rails_helper'

def basic_pass(path) #---❶
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end


RSpec.describe "ユーザーログイン機能", type: :system do

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # サインインページへ移動する
    visit  new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    # ログインボタンをクリックする
    click_on('Log in')
    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する

    # トップページに遷移する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # 誤ったユーザー情報を入力する

    # ログインボタンをクリックする

    # サインインページに戻ってきていることを確認する

  end
end

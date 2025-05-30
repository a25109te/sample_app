require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: 'Example User',
      email: 'example@railstutorial.org',
      password: '1password',
      password_confirmation: '1password'
    )
  end

  test 'login with invalid information (blank password)' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '', password: '' } }
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email,
                                          password: '1password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end
end

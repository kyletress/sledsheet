require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, user: { name:  "", email: "hello@invalid",
                               password: "foo", password_confirmation: "bar" }
    end
    assert_template 'devise/registrations/new'
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post_via_redirect user_registration_path, user: { name:  "Example User", email: "user@example.com", password: "password", password_confirmation: "password" }
    end

    assert_template 'users/show'
    #assert is_logged_in?
  end
end

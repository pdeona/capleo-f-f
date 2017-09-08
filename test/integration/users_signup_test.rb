require 'test_helper'

class UsersSignUpTest < ActionDispatch::IntegrationTest
  test "invalid signup info given" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: {
        user: {
          name: "",
          email: "invalid@ex.com",
          password: 'foo',
          password_confirmation: 'bar'
        }
      }
    end
    assert_template 'users/new'
  end
end

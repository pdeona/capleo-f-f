require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cart_new_url
    assert_response :success
  end

  test "should get create" do
    get cart_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_destroy_url
    assert_response :success
  end

end

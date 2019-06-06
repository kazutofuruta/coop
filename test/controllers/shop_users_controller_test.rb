require 'test_helper'

class ShopUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shop_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get shop_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get shop_users_show_url
    assert_response :success
  end

  test "should get index" do
    get shop_users_index_url
    assert_response :success
  end

end

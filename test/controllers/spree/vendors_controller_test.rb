require 'test_helper'

class Spree::VendorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spree_vendors_new_url
    assert_response :success
  end

  test "should get create" do
    get spree_vendors_create_url
    assert_response :success
  end

  test "should get update" do
    get spree_vendors_update_url
    assert_response :success
  end

  test "should get edit" do
    get spree_vendors_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get spree_vendors_destroy_url
    assert_response :success
  end

  test "should get index" do
    get spree_vendors_index_url
    assert_response :success
  end

  test "should get show" do
    get spree_vendors_show_url
    assert_response :success
  end

end

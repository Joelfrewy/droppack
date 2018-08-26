require 'test_helper'

class SpreePacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spree_pack = spree_packs(:one)
  end

  test "should get index" do
    get spree_packs_url
    assert_response :success
  end

  test "should get new" do
    get new_spree_pack_url
    assert_response :success
  end

  test "should create spree_pack" do
    assert_difference('SpreePack.count') do
      post spree_packs_url, params: { spree_pack: {  } }
    end

    assert_redirected_to spree_pack_url(SpreePack.last)
  end

  test "should show spree_pack" do
    get spree_pack_url(@spree_pack)
    assert_response :success
  end

  test "should get edit" do
    get edit_spree_pack_url(@spree_pack)
    assert_response :success
  end

  test "should update spree_pack" do
    patch spree_pack_url(@spree_pack), params: { spree_pack: {  } }
    assert_redirected_to spree_pack_url(@spree_pack)
  end

  test "should destroy spree_pack" do
    assert_difference('SpreePack.count', -1) do
      delete spree_pack_url(@spree_pack)
    end

    assert_redirected_to spree_packs_url
  end
end

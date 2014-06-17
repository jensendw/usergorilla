require 'test_helper'

class UidsControllerTest < ActionController::TestCase
  setup do
    @uid = uids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uid" do
    assert_difference('Uid.count') do
      post :create, uid: { uid: @uid.uid, user_id: @uid.user_id }
    end

    assert_redirected_to uid_path(assigns(:uid))
  end

  test "should show uid" do
    get :show, id: @uid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uid
    assert_response :success
  end

  test "should update uid" do
    patch :update, id: @uid, uid: { uid: @uid.uid, user_id: @uid.user_id }
    assert_redirected_to uid_path(assigns(:uid))
  end

  test "should destroy uid" do
    assert_difference('Uid.count', -1) do
      delete :destroy, id: @uid
    end

    assert_redirected_to uids_path
  end
end

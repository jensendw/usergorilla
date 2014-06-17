require 'test_helper'

class SshkeysControllerTest < ActionController::TestCase
  setup do
    @sshkey = sshkeys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sshkeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sshkey" do
    assert_difference('Sshkey.count') do
      post :create, sshkey: { key: @sshkey.key, user_id: @sshkey.user_id }
    end

    assert_redirected_to sshkey_path(assigns(:sshkey))
  end

  test "should show sshkey" do
    get :show, id: @sshkey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sshkey
    assert_response :success
  end

  test "should update sshkey" do
    patch :update, id: @sshkey, sshkey: { key: @sshkey.key, user_id: @sshkey.user_id }
    assert_redirected_to sshkey_path(assigns(:sshkey))
  end

  test "should destroy sshkey" do
    assert_difference('Sshkey.count', -1) do
      delete :destroy, id: @sshkey
    end

    assert_redirected_to sshkeys_path
  end
end

require 'test_helper'

class AccttypesControllerTest < ActionController::TestCase
  setup do
    @accttype = accttypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accttypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accttype" do
    assert_difference('Accttype.count') do
      post :create, accttype: { accttype: @accttype.accttype, user_id: @accttype.user_id }
    end

    assert_redirected_to accttype_path(assigns(:accttype))
  end

  test "should show accttype" do
    get :show, id: @accttype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accttype
    assert_response :success
  end

  test "should update accttype" do
    patch :update, id: @accttype, accttype: { accttype: @accttype.accttype, user_id: @accttype.user_id }
    assert_redirected_to accttype_path(assigns(:accttype))
  end

  test "should destroy accttype" do
    assert_difference('Accttype.count', -1) do
      delete :destroy, id: @accttype
    end

    assert_redirected_to accttypes_path
  end
end

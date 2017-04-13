require 'test_helper'

class ShareBuyRequestsControllerTest < ActionController::TestCase
  setup do
    @share_buy_request = share_buy_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:share_buy_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create share_buy_request" do
    assert_difference('ShareBuyRequest.count') do
      post :create, share_buy_request: { : @share_buy_request., : @share_buy_request., reference: @share_buy_request.reference }
    end

    assert_redirected_to share_buy_request_path(assigns(:share_buy_request))
  end

  test "should show share_buy_request" do
    get :show, id: @share_buy_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @share_buy_request
    assert_response :success
  end

  test "should update share_buy_request" do
    patch :update, id: @share_buy_request, share_buy_request: { : @share_buy_request., : @share_buy_request., reference: @share_buy_request.reference }
    assert_redirected_to share_buy_request_path(assigns(:share_buy_request))
  end

  test "should destroy share_buy_request" do
    assert_difference('ShareBuyRequest.count', -1) do
      delete :destroy, id: @share_buy_request
    end

    assert_redirected_to share_buy_requests_path
  end
end

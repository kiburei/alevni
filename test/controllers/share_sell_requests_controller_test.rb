require 'test_helper'

class ShareSellRequestsControllerTest < ActionController::TestCase
  setup do
    @share_sell_request = share_sell_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:share_sell_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create share_sell_request" do
    assert_difference('ShareSellRequest.count') do
      post :create, share_sell_request: { integer: @share_sell_request.integer, integer: @share_sell_request.integer, references: @share_sell_request.references }
    end

    assert_redirected_to share_sell_request_path(assigns(:share_sell_request))
  end

  test "should show share_sell_request" do
    get :show, id: @share_sell_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @share_sell_request
    assert_response :success
  end

  test "should update share_sell_request" do
    patch :update, id: @share_sell_request, share_sell_request: { integer: @share_sell_request.integer, integer: @share_sell_request.integer, references: @share_sell_request.references }
    assert_redirected_to share_sell_request_path(assigns(:share_sell_request))
  end

  test "should destroy share_sell_request" do
    assert_difference('ShareSellRequest.count', -1) do
      delete :destroy, id: @share_sell_request
    end

    assert_redirected_to share_sell_requests_path
  end
end

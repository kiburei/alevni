require 'test_helper'

class NewsAndEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_and_event = news_and_events(:one)
  end

  test "should get index" do
    get news_and_events_url
    assert_response :success
  end

  test "should get new" do
    get new_news_and_event_url
    assert_response :success
  end

  test "should create news_and_event" do
    assert_difference('NewsAndEvent.count') do
      post news_and_events_url, params: { news_and_event: { post: @news_and_event.post, title: @news_and_event.title } }
    end

    assert_redirected_to news_and_event_url(NewsAndEvent.last)
  end

  test "should show news_and_event" do
    get news_and_event_url(@news_and_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_and_event_url(@news_and_event)
    assert_response :success
  end

  test "should update news_and_event" do
    patch news_and_event_url(@news_and_event), params: { news_and_event: { post: @news_and_event.post, title: @news_and_event.title } }
    assert_redirected_to news_and_event_url(@news_and_event)
  end

  test "should destroy news_and_event" do
    assert_difference('NewsAndEvent.count', -1) do
      delete news_and_event_url(@news_and_event)
    end

    assert_redirected_to news_and_events_url
  end
end

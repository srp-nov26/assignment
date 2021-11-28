require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { allday: @event.allday, description: @event.description, endtime: @event.endtime, rsvp: @event.rsvp, starttime: @event.starttime, title: @event.title, user_id: @event.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { allday: @event.allday, description: @event.description, endtime: @event.endtime, rsvp: @event.rsvp, starttime: @event.starttime, title: @event.title, user_id: @event.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event), as: :json
    end

    assert_response 204
  end
end

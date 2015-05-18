require 'test_helper'

class TimeSpansControllerTest < ActionController::TestCase
  setup do
    @time_span = time_spans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_spans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_span" do
    assert_difference('TimeSpan.count') do
      post :create, time_span: { end: @time_span.end, start: @time_span.start, task_id: @time_span.task_id }
    end

    assert_redirected_to time_span_path(assigns(:time_span))
  end

  test "should show time_span" do
    get :show, id: @time_span
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_span
    assert_response :success
  end

  test "should update time_span" do
    patch :update, id: @time_span, time_span: { end: @time_span.end, start: @time_span.start, task_id: @time_span.task_id }
    assert_redirected_to time_span_path(assigns(:time_span))
  end

  test "should destroy time_span" do
    assert_difference('TimeSpan.count', -1) do
      delete :destroy, id: @time_span
    end

    assert_redirected_to time_spans_path
  end
end

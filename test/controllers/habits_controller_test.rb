require "test_helper"

class HabitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get habits_index_url
    assert_response :success
  end

  test "should get show" do
    get habits_show_url
    assert_response :success
  end

  test "should get create" do
    get habits_create_url
    assert_response :success
  end
end

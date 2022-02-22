require "test_helper"

class CroniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crony = cronies(:one)
  end

  test "should get index" do
    get cronies_url
    assert_response :success
  end

  test "should get new" do
    get new_crony_url
    assert_response :success
  end

  test "should create crony" do
    assert_difference("Crony.count") do
      post cronies_url, params: { crony: { email: @crony.email, first_name: @crony.first_name, last_name: @crony.last_name, phone: @crony.phone, twitter: @crony.twitter } }
    end

    assert_redirected_to crony_url(Crony.last)
  end

  test "should show crony" do
    get crony_url(@crony)
    assert_response :success
  end

  test "should get edit" do
    get edit_crony_url(@crony)
    assert_response :success
  end

  test "should update crony" do
    patch crony_url(@crony), params: { crony: { email: @crony.email, first_name: @crony.first_name, last_name: @crony.last_name, phone: @crony.phone, twitter: @crony.twitter } }
    assert_redirected_to crony_url(@crony)
  end

  test "should destroy crony" do
    assert_difference("Crony.count", -1) do
      delete crony_url(@crony)
    end

    assert_redirected_to cronies_url
  end
end

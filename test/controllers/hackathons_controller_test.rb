require 'test_helper'

class HackathonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hackathon = hackathons(:one)
  end

  test "should get index" do
    get hackathons_url
    assert_response :success
  end

  test "should get new" do
    get new_hackathon_url
    assert_response :success
  end

  test "should create hackathon" do
    assert_difference('Hackathon.count') do
      post hackathons_url, params: { hackathon: { end_date: @hackathon.end_date, start_date: @hackathon.start_date, title: @hackathon.title } }
    end

    assert_redirected_to hackathon_url(Hackathon.last)
  end

  test "should show hackathon" do
    get hackathon_url(@hackathon)
    assert_response :success
  end

  test "should get edit" do
    get edit_hackathon_url(@hackathon)
    assert_response :success
  end

  test "should update hackathon" do
    patch hackathon_url(@hackathon), params: { hackathon: { end_date: @hackathon.end_date, start_date: @hackathon.start_date, title: @hackathon.title } }
    assert_redirected_to hackathon_url(@hackathon)
  end

  test "should destroy hackathon" do
    assert_difference('Hackathon.count', -1) do
      delete hackathon_url(@hackathon)
    end

    assert_redirected_to hackathons_url
  end
end

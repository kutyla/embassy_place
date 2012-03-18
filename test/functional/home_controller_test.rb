require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  def setup
    #
  end

  test "should get the homepage" do
    get :index
    assert_response :success
  end

  test "should get the gallery" do
    get :gallery
    assert_response :success
  end

  test "should get features" do
    get :features
    assert_response :success
  end

end
require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  def setup
    #
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
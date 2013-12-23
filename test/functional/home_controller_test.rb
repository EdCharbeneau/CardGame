require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get Game" do
    get :Game
    assert_response :success
  end

end

require 'test_helper'

class SetControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

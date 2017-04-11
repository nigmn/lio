require 'test_helper'

class ReverseControllerTest < ActionController::TestCase
  test "should get in" do
    get :in
    assert_response :success
  end

  test "should get out" do
    get :out
    assert_response :success
  end

end

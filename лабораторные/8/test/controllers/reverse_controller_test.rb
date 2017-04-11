require 'test_helper'

class ReverseControllerTest < ActionController::TestCase
  test "should get data" do
    get :data
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end
  
  test "should get right data from task" do
    get :show, {val: 6}
    assert_equal assigns[:result].first, ['6','110','011','3']
  end
  
  test "should get error" do
    get :show, {val: 'notanumber'}
    assert_equal assigns[:result].first, ['Input','data','is not a','number']
  end
  
end

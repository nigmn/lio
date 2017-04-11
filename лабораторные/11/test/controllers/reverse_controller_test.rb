require 'test_helper'

class ReverseControllerTest < ActionController::TestCase

  test "should get different client data" do
    get :show, {val: '5'}
    v1=assigns[:result]
    get :show, {val: '6'}
    v2=assigns[:result]
    assert_not_equal v1,v2
  end

end

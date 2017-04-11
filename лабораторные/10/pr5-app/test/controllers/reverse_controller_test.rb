require 'test_helper'

class ReverseControllerTest < ActionController::TestCase

  test "should get rss" do
    get :show, :format => 'rss'
    assert_equal response.content_type, "application/rss+xml"
  end
  
end

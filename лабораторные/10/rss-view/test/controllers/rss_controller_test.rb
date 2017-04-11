require 'test_helper'

class RssControllerTest < ActionController::TestCase
  test "should get correct respond" do
    get :transform, {val: 5}
    assert_equal assigns[:result].first, "\nOne of the many. Number 5 (binary code: 101) transformed in 5, reversed binary code: 101"
  end
  
  test "should get error respond" do
    get :transform, {val: 'NaN'}
    assert_equal assigns[:result].first, "\nAn processing error because of an input mistake"
  end
  
  test "should get html" do
    get :transform, {val: 'NaN'}
    assert_equal response.content_type, "text/html"
  end
  
  test "should get xml" do
    get :transform, {val: 'NaN', format: 'rss'}
    assert_equal response.content_type, "application/rss+xml"
  end
  
  test "should get different data" do
    get :transform, {val: 5}
    v1 = assigns[:result]
    get :transform, {val: 6}
    v2 = assigns[:result]
    assert_not_equal v1,v2
  end

end

require 'test_helper'

class UsrIntTest < ActionDispatch::IntegrationTest
  test "should login" do
    # post_via_redirect "/users", :login => 'testlog', :pswd => 't_pswd'
    User.create(login: 'tlog', pswd: 'tpswd')
    get "/reverse/login", {l: 'tlog', p: 'tpswd'}
    get "/reverse/out", {val: '10'}
    assert_response :success
   end

  test "should not work unlogged" do
    get "/reverse/exit"
    get "/reverse/out", {val: '10'}
    assert redirect?
    assert_redirected_to "http://www.example.com/reverse/auth" #Unnecessary
   end

end

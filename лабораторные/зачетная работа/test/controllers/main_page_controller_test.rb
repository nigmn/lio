require 'test_helper'

class MainPageControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get main_page_main_url
    assert_response :success
  end

  test "should get company" do
    get main_page_company_url
    assert_response :success
  end

  test "should get calc" do
    get main_page_calc_url
    assert_response :success
  end

  test "should get works" do
    get main_page_works_url
    assert_response :success
  end

end

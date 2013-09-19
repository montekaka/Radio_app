require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get dropbox_authorized" do
    get :dropbox_authorized
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

end

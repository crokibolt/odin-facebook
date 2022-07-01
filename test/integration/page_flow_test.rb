require "test_helper"

class PageFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:david)
  end

  test "should redirect to login page" do
    sign_out :user
    get '/'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should get new" do
    get '/posts/new'
    assert_response :success
  end
end

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get thankyou" do
    get static_pages_thankyou_url
    assert_response :success
  end

end

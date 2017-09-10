require 'test_helper'

class MemberControllerTest < ActionDispatch::IntegrationTest
  test "should get wishlist" do
    get member_wishlist_url
    assert_response :success
  end

end

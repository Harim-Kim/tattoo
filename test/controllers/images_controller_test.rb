require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get error" do
    get images_error_url
    assert_response :success
  end

end

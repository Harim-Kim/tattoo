require 'test_helper'

class TattoohsopControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tattoohsop_new_url
    assert_response :success
  end

  test "should get edit" do
    get tattoohsop_edit_url
    assert_response :success
  end

end

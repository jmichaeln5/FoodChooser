require 'test_helper'

class SelectedControllerTest < ActionDispatch::IntegrationTest
  test "should get random_item" do
    get selected_random_item_url
    assert_response :success
  end

end

require 'test_helper'

class RepresentativeControllerTest < ActionController::TestCase
  test "should get postcode" do
    get :postcode
    assert_response :success
  end

end

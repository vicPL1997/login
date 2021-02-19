require "test_helper"

class InicioControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get inicio_home_url
    assert_response :success
  end
end

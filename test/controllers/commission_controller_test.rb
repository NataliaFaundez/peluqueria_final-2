require 'test_helper'

class CommissionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commission_index_url
    assert_response :success
  end

  test "should get employee" do
    get commission_employee_url
    assert_response :success
  end

end

require 'test_helper'

class WorkerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worker_index_url
    assert_response :success
  end

end

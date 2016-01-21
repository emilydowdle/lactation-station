require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "#index is successful" do
    get :index

    assert_response :success
  end
end

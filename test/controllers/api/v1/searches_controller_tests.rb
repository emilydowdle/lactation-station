require 'test_helper'

class Api::V1::SearchesControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "index returns the correct number of search items" do
    get :index, format: :json

    assert_equal Search.count, json_response.count
  end

  test "#index contains search that have the correct properties" do
    get :index, format: :json

    json_response.each do |search|
      assert search["id"]
      assert search["name"]
      assert search["summary"]
      assert search["created_at"]
      assert search["updated_at"]
    end
  end
end

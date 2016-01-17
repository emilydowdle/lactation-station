require 'test_helper'

class Api::V1::DrugsControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "index returns the correct number of drug items" do
    get :index, format: :json

    assert_equal Drug.count, json_response.count
  end

  test "#index contains drug that have the correct properties" do
    get :index, format: :json

    json_response.each do |drug|
      assert drug["id"]
      assert drug["name"]
      assert drug["summary"]
      assert drug["drug_levels"]
      assert drug["effects_in_breastfed_infants"]
      assert drug["effects_on_lactation_and_breastmilk"]
      assert drug["alternate_drugs"]
      assert drug["cas_registry_number"]
      assert drug["drug_classes"]
      assert drug["created_at"]
      assert drug["updated_at"]
    end
  end

  test "#show responds to json" do
    get :show, format: :json, symbolize_names: true, name: Drug.first.name

    assert_response :success
  end

  test "#show returns a record" do
    get :show, format: :json, symbolize_names: true, name: Drug.first.name

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct drug item" do
    get :show, format: :json, symbolize_names: true, name: Drug.first.name

    assert_equal Drug.first.id, json_response["id"]
    assert_equal Drug.first.name, json_response["name"]
    assert_equal Drug.first.drug_levels, json_response["drug_levels"]
    assert_equal Drug.first.effects_in_breastfed_infants, json_response["effects_in_breastfed_infants"]
  end

  test "letter match responds with json" do
    get :letter_match, format: :json, letter: "D"

    assert_response :success
    assert_kind_of Array, json_response
  end

  test "#letter match returns multiple drug items when searched with a single letter" do
    get :letter_match, format: :json, letter: "D"

    assert_response :success
    assert_equal 2, json_response.count
    assert_equal Drug.first.id, json_response[1]["id"]
    assert_equal Drug.first.name, json_response[1]["name"]
  end
end

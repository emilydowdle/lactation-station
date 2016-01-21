require 'test_helper'

class DrugsControllerTest < ActionController::TestCase
  test "#index is successful" do
    get :index

    assert_response :success
  end

  test "#show is successful" do
    VCR.use_cassette("drugs_controller#show") do
      get :show, name: "Amoxicillin"

      assert_response :success
    end
  end
end

class OpenFdaServiceTest < ActiveSupport::TestCase

  test "Open FDA response by name: Amoxicillin" do
    VCR.use_cassette("open_fda_service#response_amoxicillin") do
      response = OpenFdaService.new.drugs_by_name("Amoxicillin")

      assert_equal true, response.response.include?(:nursing_mothers)
      assert_equal "20120921", response.response[:effective_time]
      assert_equal "75ca51d0-343c-48c2-9873-2a3c45e8ffe8", response.response[:id]
      assert_equal ["AMOXICILLIN"], response.response[:openfda][:generic_name]
    end
  end

  test "Open FDA response by name: Sertraline" do
    VCR.use_cassette("open_fda_service#response_sertraline") do
      response = OpenFdaService.new.drugs_by_name("Sertraline")

      assert_equal true, response.response.include?(:nursing_mothers)
      assert_equal "20141010", response.response[:effective_time]
      assert_equal "86e3b025-21ce-4302-8c1d-1e106ed752e2", response.response[:id]
      assert_equal ["SERTRALINE HYDROCHLORIDE"], response.response[:openfda][:generic_name]
    end
  end

  test "Open FDA response by name: sertraline (lower case)" do
    VCR.use_cassette("open_fda_service#response_sertraline_lower_case") do
      response = OpenFdaService.new.drugs_by_name("sertraline")

      assert_equal true, response.response.include?(:nursing_mothers)
      assert_equal "20141010", response.response[:effective_time]
      assert_equal "86e3b025-21ce-4302-8c1d-1e106ed752e2", response.response[:id]
      assert_equal ["SERTRALINE HYDROCHLORIDE"], response.response[:openfda][:generic_name]
    end
  end

  test "Open FDA response by name: two letter drug" do
    VCR.use_cassette("open_fda_service#response_Alglucosidase_Alfa") do
      response = OpenFdaService.new.drugs_by_name("Alglucosidase Alfa")

      assert_equal true, response.response.include?(:nursing_mothers)
      assert_equal "20150116", response.response[:effective_time]
      assert_equal "dc1d77b8-40b5-4b38-a03e-1ebcbc7ac7d0", response.response[:id]
      assert_equal ["ALGLUCOSIDASE ALFA"], response.response[:openfda][:generic_name]
    end
  end

  test "Open FDA response by name: drug with number in name" do
    VCR.use_cassette("open_fda_service#response_Ammonia_N_13") do
      response = OpenFdaService.new.drugs_by_name("Ammonia N 13")

      assert_equal "20150521", response.response[:effective_time]
      assert_equal "169b8128-1699-4b21-e054-00144ff8d46c", response.response[:id]
      assert_equal ["AMMONIA N 13"], response.response[:openfda][:generic_name]
      assert_equal false, response.response.include?(:nursing_mothers)
    end
  end

  test "Open FDA response by name for no match" do
    VCR.use_cassette("open_fda_service#response_no_match") do
      response = OpenFdaService.new.drugs_by_name("lkjsdflkj")

      assert_equal "Not Found", response
    end
  end

  test "Open FDA response by name for no match with symbol in search" do
    VCR.use_cassette("open_fda_service#response_no_match_symbol") do
      response = OpenFdaService.new.drugs_by_name("l--kjsdflkj")

      assert_equal "Not Found", response
    end
  end

  test "Open FDA response by name for number search" do
    VCR.use_cassette("open_fda_service#response_number_search") do
      response = OpenFdaService.new.drugs_by_name("12345")

      assert_equal "Not Found", response
    end
  end
end

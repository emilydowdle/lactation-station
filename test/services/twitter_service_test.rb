class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    VCR.use_cassette("twitter_service#setup") do
      stub_user
      @client = stub_user
    end
  end

  test "twitter response" do
    VCR.use_cassette("twitter_service#response") do
      response = TwitterService.new(@client).client

      assert_equal "Emily Freeman Dowdle", response.user.name
      assert_equal "EditingEmily", response.user.screen_name
      assert_equal 75, response.user.statuses_count
    end
  end
end

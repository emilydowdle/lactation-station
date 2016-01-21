require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette("twitter_service#setup") do
      stub_user
      @client = stub_user
    end
  end

  test "client name" do
    VCR.use_cassette("twitter_service#name") do
      assert_equal "Emily Freeman Dowdle", @client.name
    end
  end

  test "client handle" do
    VCR.use_cassette("twitter_service#handle") do
      assert_equal "EditingEmily", @client.handle
    end
  end

  test "client tweet" do
    VCR.use_cassette("twitter_service#tweet") do
      assert_equal "So awesome!", @client.tweet("So awesome!").text
    end
  end

  test "client breastfeeding timeline" do
    VCR.use_cassette("twitter_service#timeline") do
      assert_equal "RT @TheralineUK: #winitwednesday Theraline Original #pregnancypillow #breastfeeding RT &amp; follow to enter https://t.co/Hqm8O5JexC https://t.…", @client.breastfeeding_timeline.first.text
    end
  end

  test "client profile photo" do
    VCR.use_cassette("twitter_service#profile_photo") do
      assert_equal "https://pbs.twimg.com/profile_images/673321176458899456/u7idSLyu.jpg", @client.profile_photo.to_s
    end
  end
end

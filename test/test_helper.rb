ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/stub_any_instance'
require 'mocha/mini_test'
require 'webmock'
require 'vcr'
require 'simplecov'
SimpleCov.start

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end

  def stub_user
    @stub_user ||= User.create(name: "Emily Freeman Dowdle",
                               screen_name: "EditingEmily",
                               uid: 1066151600,
                               oauth_token: ENV["test_oauth_token"],
                               oauth_token_secret: ENV["test_oauth_token_secret"])
  end
end

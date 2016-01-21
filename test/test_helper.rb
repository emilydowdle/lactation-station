ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/stub_any_instance'
require 'minitest/pride'
require 'mocha/mini_test'
require 'capybara/rails'
require 'webmock'
require 'vcr'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'simplecov'
SimpleCov.start

class ActiveSupport::TestCase

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

  class ActionController::TestCase
    def json_response
      JSON.parse(response.body)
    end
  end

  class ActionDispatch::IntegrationTest
    include Capybara::DSL
    
    def teardown
      reset_session!
    end
  end
end

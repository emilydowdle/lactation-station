require "test_helper"

class UserViewsCorrectDrugsAfterAjaxLoads < ActionDispatch::IntegrationTest
  def setup
    VCR.use_cassette("drugs_index_test#setup") do
      @url = "https://lactationstation.herokuapp.com/drugs"
      @driver = Selenium::WebDriver.for :remote
    end
  end

  def test_only_b_drugs_show_up
    VCR.use_cassette("drugs_index#b") do
      @driver.navigate.to @url
      element = @driver.find_element(:id, 'letter-b')
      @driver.click element
      save_and_open_page
    end
  end

  def teardown
    @driver.quit if @driver
  end

  def count_items(letter)
    Drug.where("name like ?", "#{letter}%").count
  end
end

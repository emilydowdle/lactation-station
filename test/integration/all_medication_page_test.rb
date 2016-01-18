require "test_helper"

class UserSeesCorrectMedicationsOnIndexPage < ActionDispatch::IntegrationTest
  def setup
    url = "localhost:3000/drugs"
    @driver = Selenium::WebDriver.for(:remote, :url => url)
    visit drugs_path
  end

  test "displays correct text" do
    assert page.has_content? "All Medications"
    assert page.has_button? "B", "X"
    assert page.has_content? "Information from LactMed"
    assert page.has_link? "View More Information"
  end

  test "displays only A drugs" do
    count = count_items("A")

    page.assert_selector('h3', count: count)
  end

  test "displays only B drugs" do
    # VCR.use_cassette("all_medication_page#b_drugs") do
      count = count_items("B")

      element = @driver.find_element("B")
      element.submit
      save_and_open_page
      click_button "B"

      page.assert_selector('h3', count: count)
    # end

  end

  def teardown
    @driver.quit
  end

  def count_items(letter)
    Drug.where("name like ?", "#{letter}%").count
  end
end

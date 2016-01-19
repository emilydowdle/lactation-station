require "test_helper"

class UserSeesCorrectMedicationsOnIndexPage < ActionDispatch::IntegrationTest
  def setup
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

  def count_items(letter)
    Drug.where("name like ?", "#{letter}%").count
  end
end

require "test_helper"

class UserSeesCorrectMedicationsOnIndexPage < ActionDispatch::IntegrationTest
  def setup
    visit drugs_path
  end

  test "displays correct text" do
    assert page.has_content? "All Medications"
    assert page.has_button? "B", "X"
    assert page.has_content? "Information from LactMed"
  end

  test "displays only A drugs" do
    count = count_items("A")

    page.assert_selector('h3', count: count)
  end

  test "each drug's show page displays correct information" do
    VCR.use_cassette("drug_index#show_page_links_work") do
      page.all(:css, '.drug-show-page-link').each do |el|
        visit el[:href]
        
        assert page.has_content? "Information from LactMed"
      end
    end
  end

  def count_items(letter)
    Drug.where("name like ?", "#{letter}%").count
  end
end

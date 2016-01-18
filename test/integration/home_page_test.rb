require "test_helper"

class UserSeesCorrectHomepage < ActionDispatch::IntegrationTest
  def setup
    visit home_index_path
  end

  test "displays correct text" do
    assert page.has_content? "Welcome"
    within "#recent-searches" do
      assert page.has_content? "Recent Searches"
    end
    within "#common-medications" do
      assert page.has_content? "Common Medications"
      assert page.has_content? "Metformin"
      assert page.has_content? "Sertraline"
      assert page.has_content? "Amoxicillin"
    end
    assert page.has_content? "Search By Name"
    assert page.has_content? "Search By Cause"
    assert page.has_content? "View All Medications"
  end

  test "sertraline link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#sertraline") do
      within "#common-medications" do
        click_link "Sertraline"
      end

      assert drug_path(name: "Sertraline"), current_path
      assert page.has_content? "Sertraline"
    end
  end

  test "amoxicillin link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#amoxicillin") do
      within "#common-medications" do
        click_link "Amoxicillin"
      end

      assert drug_path(name: "Amoxicillin"), current_path
      assert page.has_content? "Amoxicillin"
    end
  end

  test "levothyroxine(T4) link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#levothyroxine(T4)") do
      within "#common-medications" do
        click_link "Levothyroxine"
      end

      assert drug_path(name: "Levothyroxine"), current_path
      assert page.has_content? "Levothyroxine"
    end
  end

  test "simvastatin link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#simvastatin") do
      within "#common-medications" do
        click_link "Simvastatin"
      end

      assert drug_path(name: "Simvastatin"), current_path
      assert page.has_content? "Simvastatin"
    end
  end

  test "search by name button leads to correct page" do
    within "#search-by-name" do
      click_button "Search"
    end

    assert drugs_search_name_path, current_path
    assert page.has_content? "Search by Drug Name"
    assert page.has_content? "Enter the name of the medication below."
  end

  test "search by cause button leads to correct page" do
    within "#all-medications" do
      click_button "View All"
    end

    assert drugs_path, current_path
    assert page.has_content? "All Medications"
    assert page.has_button? "A", "Z"
    assert page.has_content? "Information from LactMed"
    assert page.has_content? "Acetohexamide"
    assert page.has_content? "Acebutolol"
    assert page.has_content? "Acarbose"
    assert page.has_link? "View More Information"
  end
end

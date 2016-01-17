require "test_helper"

class UserSeesCorrectHomepage < ActionDispatch::IntegrationTest
  test "displays correct text" do
    visit home_index_path

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
      visit home_index_path

      within "#common-medications" do
        click_link "Sertraline"
      end

      assert drug_path(name: "Sertraline"), current_path
      assert page.has_content? "Sertraline"
    end
  end

  test "amoxicillin link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#amoxicillin") do
      visit home_index_path

      within "#common-medications" do
        click_link "Amoxicillin"
      end

      assert drug_path(name: "Amoxicillin"), current_path
      assert page.has_content? "Amoxicillin"
    end
  end

  test "levothyroxine(T4) link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#levothyroxine(T4)") do
      visit home_index_path

      within "#common-medications" do
        click_link "Levothyroxine"
      end

      assert drug_path(name: "Levothyroxine"), current_path
      assert page.has_content? "Levothyroxine"
    end
  end

  test "simvastatin link leads to correct pages" do
    VCR.use_cassette("homepage_common_meds#simvastatin") do
      visit home_index_path

      within "#common-medications" do
        click_link "Simvastatin"
      end

      assert drug_path(name: "Simvastatin"), current_path
      assert page.has_content? "Simvastatin"
    end
  end
end

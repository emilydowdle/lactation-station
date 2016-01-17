require "test_helper"

class UserSeesCorrectWelcomePage < ActionDispatch::IntegrationTest
  test "homepage displays correct text" do
    visit root_path

    assert page.has_content? "Your baby's safety is our priority"
    assert page.has_content? "Find out which medications are safe to take while breastfeeding"
  end
end

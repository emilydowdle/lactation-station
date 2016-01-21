require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "recent searches" do
    search = Search.create!(drug_id: 20,
                            created_at: Time.now,
                            updated_at: Time.now)

    assert_equal 1, Search.recent.count
    assert_equal "Aztreonam", Search.recent.first.drug.name
    assert_equal "Aztreonam", Search.recent.first.drug_name
    assert_equal search.drug_id, Search.recent.first.drug.id
  end
end

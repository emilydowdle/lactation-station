require 'test_helper'

class DrugTest < ActiveSupport::TestCase
  test "starts with query returns multiple records" do
    query = Drug.starts_with_query(letter: "D")

    assert_equal 2, query.count
  end

  test "starts with query returns correct values" do
    query = Drug.starts_with_query(letter: "D")

    assert_equal Drug.first.id, query[1].id
    assert_equal Drug.first.name, query[1].name
  end

  test "when there are no matches starts with query returns no records" do
    query = Drug.starts_with_query(letter: "A")

    assert_equal 0, query.count
  end
end

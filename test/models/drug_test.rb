require 'test_helper'

class DrugTest < ActiveSupport::TestCase
  test "starts with query returns multiple records" do
    query = Drug.starts_with_query(letter: "D")

    assert_equal 78, query.count
  end

  test "starts with query returns correct number of items" do
    query = Drug.starts_with_query(letter: "D")

    assert_equal 78, query.first.id
    assert_equal 78, query.count
  end

  test "returns correct number of drugs when searched with more than one letter" do
    query = Drug.starts_with_query(letter: "Ac")

    assert_equal 13, query.count
  end
end

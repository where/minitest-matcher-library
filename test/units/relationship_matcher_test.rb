require 'test_helper'

class RelationshipMatcherTest < MiniTest::Unit::TestCase
  def test_relationships_success
    assert_must belong_to(:yolo), Swag
    assert_must have_many(:swags), Yolo
  end

  def test_relationships_fail
    assert_wont belong_to(:yolo), Yolo
  end
end

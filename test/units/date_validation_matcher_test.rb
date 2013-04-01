require 'test_helper'

class DateValidationMatcherTest < MiniTest::Unit::TestCase
  def test_success
    swag = Swag.new
    assert_must validate_datetime(:when_i_have_fomo), swag
  end

  def test_failure
    yolo = Yolo.new
    assert_wont validate_datetime(:the_day_i_yoloed_all_day), yolo
  end
end

require 'test_helper'

class AssertMicroformatsTest < Test::Unit::TestCase

  def test_should_fail_to_find_an_hcard_in_an_empty_string
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat '', :hcard
    end
  end

  def test_should_find_a_simple_hcard
    assert_microformat '<span class="vcard"><span class="fn">George Brocklehurst</span></span>', :hcard
  end

  def test_should_not_find_hcalendar_when_only_hcard_is_present
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat '<span class="vcard"><span class="fn">George Brocklehurst</span></span>', :hcalendar
    end
  end

  def test_should_raise_when_microformat_type_is_invalid
    assert_raise(ArgumentError) do
      assert_microformat '', :invalid_microformat_type
    end
  end

end

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

end

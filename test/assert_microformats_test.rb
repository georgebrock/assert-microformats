require 'test_helper'

class AssertMicroformatsTest < Test::Unit::TestCase

  def hcards
    {
      :simple => '<span class="vcard"><span class="fn">George Brocklehurst</span></span>',
      :complex => '<div class="vcard"><a class="fn url" href="http://georgebrock.com">George Brocklehurst</a> <span class="tel">(020)12312312</span></div>'
    }
  end

  def test_should_fail_to_find_an_hcard_in_an_empty_string
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat '', :hcard
    end
  end

  def test_should_find_a_simple_hcard
    assert_microformat hcards[:simple], :hcard
  end

  def test_should_not_find_hcalendar_when_only_hcard_is_present
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcalendar
    end
  end

  def test_should_raise_when_microformat_type_is_invalid
    assert_raise(ArgumentError) do
      assert_microformat '', :invalid_microformat_type
    end
  end

  def test_should_only_match_microformats_with_given_properties
    hcard = '<span class="vcard"><span class="fn">George Brocklehurst</span></span>'
    assert_microformat hcard, :hcard, :fn => 'George Brocklehurst'
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcard, :hcard, :fn => 'Someone Else'
    end
  end

end

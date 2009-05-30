require 'test_helper'

class AssertMicroformatsTest < Test::Unit::TestCase

  def hcards
    {
      :simple => '<span class="vcard"><span class="fn">George Brocklehurst</span></span>',
      :complex => '<div class="vcard"><a class="fn url" href="http://georgebrock.com">George Brocklehurst</a> <span class="tel">(020)12312312</span></div>'
    }
  end

  def hcalendars
    {
      :simple => '<span class="vevent"><span class="summary">An event</span>, <span class="dtstart">2009-05-30</span></span>'
    }
  end

  def hreviews
    {
      :simple => '<span class="hreview">A review of <span class="item vcard"><span class="fn org">Apple</span></span></span>'
    }
  end

  def hentries
    {
      :simple => '<div class="hentry"><h1 class="entry-title">Test Entry</h1><span class="published">2009-05-30</span><p class="entry-title">An awesome test case for hEntry</p></div>'
    }
  end

  def hresumes
    {
      :simple => '<div class="hresume"><address class="vcard"><span class="fn">George Brocklehurst</span></address></div>'
    }
  end

  def xoxo
    {
      :simple => '<ol class="xoxo"><li>Does anyone know what XOXO is for?</li><li>And so on</li></ol>'
    }
  end

  def geo
    {
      :simple => '<div class="geo"><span class="latitude">37.386013</span>, <span class="longitude">-122.082932</span></div>'
    }
  end

  def xfn
    {
      :simple => '<a href="http://georgebrock.com" rel="me">My other website</a>'
    }
  end

  def test_should_fail_to_find_any_microformats_in_an_empty_string
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :hcard end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :hcalendar end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :hreview end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :hentry end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :hresume end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :xoxo end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :geo end
    assert_raise(Test::Unit::AssertionFailedError) do assert_microformat '', :xfn end
  end

  def test_should_find_a_simple_hcard
    assert_microformat hcards[:simple], :hcard
  end

  def test_should_find_a_simple_hcalendar_event
    assert_microformat hcalendars[:simple], :hcalendar
  end

  def test_should_find_a_simple_hreview
    assert_microformat hreviews[:simple], :hreview
  end

  def test_should_find_a_simple_hentry
    assert_microformat hentries[:simple], :hentry
  end

  def test_should_find_a_simple_hresume
    assert_microformat hresumes[:simple], :hresume
  end

  def test_should_find_a_simple_xoxo_outline
    assert_microformat xoxo[:simple], :xoxo
  end

  def test_should_find_a_simple_geo_location
    assert_microformat geo[:simple], :geo
  end

  def test_should_find_a_simple_xfn_relationship
    assert_microformat xfn[:simple], :xfn
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
    assert_microformat hcards[:simple], :hcard, :fn => 'George Brocklehurst'
    assert_microformat hcards[:complex], :hcard, :fn => 'George Brocklehurst', :url => 'http://georgebrock.com', :tel => '(020)12312312'
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcard, :fn => 'Someone Else'
    end
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcard, :fn => 'George Brocklehurst', :url => 'http://www.google.com'
    end
  end

end

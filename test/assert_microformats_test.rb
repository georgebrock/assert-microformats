require 'test_helper'

class AssertMicroformatsTest < Test::Unit::TestCase

  include AssertMicroformatsTestData

  class MockTestResponse
    attr_reader :body
    def initialize(body)
      @body = body || ''
    end
  end
  def test_mock_test_response
    string = "A unique string"
    @response = MockTestResponse.new(string)
    assert_equal string, @response.body
    @response = nil
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

  def test_should_use_test_response_if_no_html_is_provided
    @response = MockTestResponse.new(hcards[:simple])
    assert_microformat hcards[:simple], :hcard, :fn => 'George Brocklehurst'
    assert_microformat @response.body, :hcard, :fn => 'George Brocklehurst'
    assert_microformat :hcard, :fn => 'George Brocklehurst'
  end

end

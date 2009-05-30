require 'test_helper'
require File.join(File.dirname(__FILE__), '..', 'lib', 'assert_microformats.rb')

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

  def test_should_fail_to_find_any_microformats_in_an_empty_string_using_dynamic_method_names
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_hcard '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_hcalendar '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_hreview '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_hentry '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_hresume '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_xoxo '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_geo '' end
    assert_raise(Test::Unit::AssertionFailedError) do assert_mf_xfn '' end
  end

  def test_should_find_a_simple_hcard
    assert_microformat hcards[:simple], :hcard
    assert_mf_hcard hcards[:simple]
  end

  def test_should_find_a_simple_hcalendar_event
    assert_microformat hcalendars[:simple], :hcalendar
    assert_mf_hcalendar hcalendars[:simple]
  end

  def test_should_find_a_simple_hreview
    assert_microformat hreviews[:simple], :hreview
    assert_mf_hreview hreviews[:simple]
  end

  def test_should_find_a_simple_hentry
    assert_microformat hentries[:simple], :hentry
    assert_mf_hentry hentries[:simple]
  end

  def test_should_find_a_simple_hresume
    assert_microformat hresumes[:simple], :hresume
    assert_mf_hresume hresumes[:simple]
  end

  def test_should_find_a_simple_xoxo_outline
    assert_microformat xoxo[:simple], :xoxo
    assert_mf_xoxo xoxo[:simple]
  end

  def test_should_find_a_simple_geo_location
    assert_microformat geo[:simple], :geo
    assert_mf_geo geo[:simple]
  end

  def test_should_find_a_simple_xfn_relationship
    assert_microformat xfn[:simple], :xfn
    assert_mf_xfn xfn[:simple]
  end

  def test_should_not_find_hcalendar_when_only_hcard_is_present
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcalendar
    end
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_mf_hcalendar hcards[:simple]
    end
  end

  def test_should_raise_when_microformat_type_is_invalid
    assert_raise(ArgumentError) do
      assert_microformat '', :invalid_microformat_type
    end
    assert_raise(ArgumentError) do
      assert_mf_invalid ''
    end
  end

  def test_should_only_match_microformats_which_match_the_given_properties
    assert_microformat hcards[:simple], :hcard, :fn => 'George Brocklehurst'
    assert_microformat hcards[:complex], :hcard, :fn => 'George Brocklehurst', :url => 'http://georgebrock.com', :tel => '(020)12312312'
    assert_mf_hcard hcards[:simple], :fn => 'George Brocklehurst'
    assert_mf_hcard hcards[:complex], :fn => 'George Brocklehurst', :url => 'http://georgebrock.com', :tel => '(020)12312312'
  end

  def test_should_not_match_microformats_which_do_not_match_the_given_properties
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcard, :fn => 'Someone Else'
    end
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_mf_hcard hcards[:simple], :fn => 'Someone Else'
    end
  end

  def test_should_not_match_microformats_which_only_match_some_of_the_given_properties
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcard, :fn => 'George Brocklehurst', :url => 'http://www.google.com'
    end
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_mf_hcard hcards[:simple], :fn => 'George Brocklehurst', :url => 'http://www.google.com'
    end
  end

  def test_should_not_match_microformats_that_do_not_have_some_of_the_given_properties
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcard, :fn => 'George Brocklehurst', :fakeprop => 'http://www.google.com'
    end
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_mf_hcard hcards[:simple], :fn => 'George Brocklehurst', :fakeprop => 'http://www.google.com'
    end
  end

  def test_should_not_match_microformats_that_do_not_have_any_of_the_given_properties
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_microformat hcards[:simple], :hcard, :fakeprop => 'http://www.google.com'
    end
    assert_raise(Test::Unit::AssertionFailedError) do
      assert_mf_hcard hcards[:simple], :fakeprop => 'http://www.google.com'
    end
  end

  def test_should_use_test_response_if_no_html_is_provided
    @response = MockTestResponse.new(hcards[:simple])
    assert_microformat @response.body, :hcard, :fn => 'George Brocklehurst'
    assert_microformat :hcard, :fn => 'George Brocklehurst'
    assert_mf_hcard @response.body, :fn => 'George Brocklehurst'
    assert_mf_hcard
    assert_mf_hcard :fn => 'George Brocklehurst'
  end

  def test_method_missing_doesnt_capture_methods_not_starting_with_assert_mf
    assert_equal false, self.respond_to?(:made_up_method)
    assert_raise(NoMethodError) do
      self.send :made_up_method
    end
  end

end

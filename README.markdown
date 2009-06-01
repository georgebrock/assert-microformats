# AssertMicroformats #

A Rails plugin to test pages that contain microformats.  Assert that certain microformats are present in the page, and that they have certain properties.


## Setup ##

    # In config/environments/test.rb
    config.gem "georgebrock-assert-microformats", :source => "http://gems.github.com/", :lib => false

## Example ##

    # Ensure @response contains an hCard
    assert_mf_hcard

    # Ensure @response contains an hCard with fn set to 'George Brocklehurst'
    assert_mf_hcard :fn => 'George Brocklehurst'

    # Ensure the HTML in my_html contains an hCalendar event with summary set to 'My party'
    assert_mf_hcalendar my_html, :summary => 'My party'


Copyright &copy; 2009 <span class="vcard"><a href="http://georgebrock.com" class="url">George Brocklehurst</a></span>, released under the MIT license

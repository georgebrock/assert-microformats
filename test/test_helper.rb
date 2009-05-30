RAILS_ENV = 'test'
require 'rubygems'
require 'test/unit'
require File.join(File.dirname(__FILE__), '..', 'init.rb')

module AssertMicroformatsTestData

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

end

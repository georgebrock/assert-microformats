require 'mofo'

module AssertMicroformats

  def assert_microformat(html, type, options = nil)
    mf = case type
      when :hcard then hCard
      when :hcalendar then hCalendar
      when :hreview then hReview
      when :hentry then hEntry
      when :hresume then hResume
      when :xoxo then XOXO
      when :geo then Geo
      when :xfn then XFN
      else raise ArgumentError.new('Unsupported microformat type')
    end

    instances = mf.find :text => html
    assert instances.is_a?(mf) || instances.length > 0
  end

end

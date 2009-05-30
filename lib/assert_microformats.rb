require 'mofo'

module AssertMicroformats

  def assert_microformat(html, type, properties = nil)
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

    instances = mf.find :all => {:text => html}
    assert instances.length > 0

    return if properties == nil

    instances.each do |i|
      found = true
      properties.each_pair { |prop, value| found &&= (i.instance_eval("#{prop}") == value) }
      return if found
    end

    assert false, "No #{type} instance was found with #{properties}"

  end

end

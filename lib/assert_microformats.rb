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
    instances = [instances] if instances.is_a?(mf)

    assert instances.length > 0

    return if options == nil

    instances.each do |i|
      found = true
      options.each_pair { |prop, value| found &&= (i.instance_eval("#{prop}") == value) }
      return if found
    end

    assert false, "No #{type} instance was found with #{options}"

  end

end

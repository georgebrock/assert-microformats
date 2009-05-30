require 'mofo'

module AssertMicroformats

  def assert_microformat(*args)

    html = @response.nil? ? '' : @response.body
    type = nil
    properties = {}

    args.each_with_index do |arg, index|
      html = arg if arg.is_a?(String)
      type = arg if arg.is_a?(Symbol)
      properties = arg if arg.is_a?(Hash)
    end

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
    raise Test::Unit::AssertionFailedError.new("No instances of #{type} were found") unless instances.length > 0

    instances.each do |instance|
      return if properties.inject(true) do |found, pair|
        prop, value = pair
        found && (instance.instance_eval("#{prop}") == value)
      end
    end

    raise Test::Unit::AssertionFailedError.new("Several instances of #{type} were found, but none had the required properties")

  end

  def method_missing(sym, *args, &block)
    type = sym.to_s.gsub(/^assert_mf_/, '').intern
    assert_microformat type, *args.push(type), &block
  end

end

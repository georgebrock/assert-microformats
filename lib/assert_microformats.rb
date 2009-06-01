gem 'mofo'
require 'mofo'

module AssertMicroformats

  MICROFORMATS = {}
  ObjectSpace.each_object(Class){|klass|
    next unless klass < Microformat
    type = klass.name.downcase.to_sym
    class_eval %%
      def assert_mf_#{type} *args, &block
        assert_microformat #{type.to_sym.inspect}, *args
      end
    %
    MICROFORMATS[type] = klass
  }

  def assert_microformat(*args)
    html = @response.nil? ? '' : @response.body
    type = nil
    properties = {}

    args.each_with_index do |arg, index|
      html = arg if arg.is_a?(String)
      type = arg if arg.is_a?(Symbol)
      properties = arg if arg.is_a?(Hash)
    end

    mf = MICROFORMATS[type] or raise ArgumentError.new('Unsupported microformat type')

    instances = mf.find :all => {:text => html}
    raise Test::Unit::AssertionFailedError.new("No instances of #{type} were found") unless instances.any?

    instances.each do |instance|
      return if properties.inject(true) do |found, pair|
        prop, value = pair
        found && instance.properties.include?(prop.to_s) && (instance.instance_eval(prop.to_s) == value)
      end
    end

    raise Test::Unit::AssertionFailedError.new("#{instances.size} instances of #{type} were found, but none had the required properties")
  end

end


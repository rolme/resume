class AddressFactory

  def self.build args
    a = args.has_key?(:config) ? build_address_from_config(args[:config]) : Address.new
  end

  def self.build_address_from_config config
    a = Address.new
    config[:ADDRESS].keys.each do |k|
      a.send(k.to_s.downcase+'=', config[:ADDRESS][k])
    end
    a
  end

end

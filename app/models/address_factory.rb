class AddressFactory

  def self.build args
    return build_address_from_config(args[:config]) if args.has_key?(:config)

    Address.new
  end

  def self.build_address_from_config config
    a = Address.new
    config.keys.each do |k|
      a.send(k.to_s.downcase + '=', config[k])
    end
    a
  end

end

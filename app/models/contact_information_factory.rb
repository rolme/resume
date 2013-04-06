class ContactInformationFactory

  def self.build args
    ci = args.has_key?(:config) ? build_contact_information_from_config(args[:config]) : ContactInformation.new
  end

  def self.build_contact_information_from_config config
    ci = ContactInformation.new
    config.keys.each do |k|
      ci.send(k.to_s.downcase+'=', config[k])
    end
    ci
  end

end

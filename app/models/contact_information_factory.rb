class ContactInformationFactory

  def self.build args
    ci = args.has_key?(:config) ? create_contact_information_from_config(args[:config]) : ContactInformation.new
  end

  def self.create_contact_information_from_config config
    ci = ContactInformation.new
    config[:CONTACT_INFORMATION].keys.each do |k|
      ci.send(k.to_s.downcase+'=', config[:CONTACT_INFORMATION][k])
    end
    ci
  end

end

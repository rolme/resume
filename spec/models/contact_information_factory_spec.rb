require "spec_helper"

describe ContactInformationFactory do
  describe '#create_contact_information' do
    it 'gets data from CONFIG[:CONTACT_INFORMATION]' do
      MY_CONFIG = {:CONTACT_INFORMATION => { :FIRST_NAME => 'test' } }
      expect(ContactInformationFactory.build(config: MY_CONFIG).first_name).to eql 'test'
    end
  end
end
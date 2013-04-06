require "spec_helper"

describe ContactInformationFactory do
  describe '#create_contact_information' do
    it 'gets data from CONFIG[:CONTACT_INFORMATION]' do
      my_config = { :FIRST_NAME => 'test', :LAST_NAME => 'last' }
      expect(ContactInformationFactory.build(config: my_config).last_name).to eql 'last'
    end
  end
end
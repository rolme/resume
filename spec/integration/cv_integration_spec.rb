require "spec_helper"

describe 'Loading CV' do
  describe 'CONACT INFORMATION' do
    it 'gets data from CONFIG[:CONTACT_INFORMATION]' do
      expect(ContactInformationFactory.create_contact_information(config: CONFIG).first_name).to eql 'Roland'
    end
  end
end
require "spec_helper"

describe 'Loading CV' do
  describe 'CONACT INFORMATION' do
    it 'gets data from CONFIG[:CONTACT_INFORMATION]' do
      expect(ContactInformationFactory.build(config: CONFIG).first_name).to eql 'Roland'
    end
  end

  describe 'ADDRESS' do
    it 'gets data from CONFIG[:ADDRESS]' do
      expect(AddressFactory.build(config: CONFIG).city).to eql 'San Jose'
    end
  end

  describe 'SKILLSET' do
    it 'gets data from CONFIG[:SKILLSET]' do
      expect(SkillsetFactory.build(config: CONFIG)[0].header).to eql "languages"
    end

    it 'gets skills from CONFIG[:SKILLSET][:KEY]' do
      expect(SkillsetFactory.build(config: CONFIG)[0].items[1].description).to eql "Ruby on Rails"
    end
  end
end
require "spec_helper"

describe 'Loading CV' do
  data_path = File.expand_path('./data')
  cv = YAML.load(File.read(File.expand_path(File.join(data_path, 'cv.template.yml'), __FILE__)))
  cv.symbolize_keys!
  sections = cv[:SECTIONS].symbolize_keys!

  describe 'CONACT INFORMATION' do
    it 'gets data from CV[:SECTIONS][:CONTACT_INFORMATION]' do
      expect(ContactInformationFactory.build(config: sections[:CONTACT_INFORMATION]).first_name).to eql 'First'
    end
  end

  describe 'ADDRESS' do
    it 'gets data from CV[:SECTIONS][:ADDRESS]' do
      expect(AddressFactory.build(config: sections[:ADDRESS]).city).to eql 'My City'
    end
  end

  describe "OBJECTIVE" do
    it "gets data from CV[:SECTIONS][:OBJECTIVE]" do
      expect(Item.new(description: sections[:OBJECTIVE]).description).to match(/objective/)
    end
  end

  describe "EDUCATION" do
    it "gets data from CV[:SECTIONS][:EDUCATION]" do
      expect(Item.new(description: sections[:EDUCATION]).description).to match(/university/i)
    end
  end

  describe 'SKILLSET' do
    it 'gets data from CV[:SECTIONS][:SKILLS]' do
      expect(SkillsetFactory.build(config: sections[:SKILLS])[0].header).to eql "languages"
    end

    it 'gets skills from CV[:SECTIONS][:SKILLS][:KEY]' do
      expect(SkillsetFactory.build(config: sections[:SKILLS])[0].items[0].description).to eql "Ruby"
    end
  end
end

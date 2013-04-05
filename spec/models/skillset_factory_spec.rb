require "spec_helper"

describe SkillsetFactory do
  describe '#build' do
    let(:my_config) { {:SKILLSET => { :LANGUAGES =>  ['Ruby', 'Ruby on Rails', 'PHP', 'Perl'] } } }

    it 'gets data from CONFIG[:SKILLSET]' do
      expect(SkillsetFactory.build(config: my_config)[0].header).to match(/languages/)
    end

    it 'loads skill item from CONFIG[:SKILLSET][:KEY]' do
      expect(SkillsetFactory.build(config: my_config)[0].items[2].description).to eql 'PHP'
    end
  end
end
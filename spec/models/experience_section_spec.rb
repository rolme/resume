require 'spec_helper'

describe ExperienceSection do
  it 'is a section type' do
    expect(Fabricate.build(:experience_section).kind_of?(Section)).to be_true
  end

  it 'delegates messages to experience' do
    es = Fabricate.build(:experience_section, experience: Fabricate.build(:experience, :title => 'test'))
    expect(es.title).to eq 'test'
  end
end
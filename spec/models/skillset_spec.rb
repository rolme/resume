require 'spec_helper'

describe Skillset do
  it 'has a valid factory' do
    expect(Fabricate.build(:skillset)).to be_valid
  end

  it 'has a type value of Skillset' do
    s = Fabricate(:skillset)
    expect(s.type).to eql "Skillset"
  end
end
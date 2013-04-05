require 'spec_helper'

describe Item do
  it 'has a valid factory' do
    expect(Fabricate.build(:item)).to be_valid
  end

  it 'fails without a description' do
    expect(Fabricate.build(:item, description: nil)).to_not be_valid
  end

  # it 'fails without a section' do
  #   expect(Fabricate.build(:item, section: nil)).to_not be_valid
  # end
end
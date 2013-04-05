require 'spec_helper'

describe Address do
  it 'has a valid factory' do
    expect(Fabricate.build(:address)).to be_valid
  end

  it 'fails without an associated user' do
    expect(Fabricate.build(:address, user: nil)).to_not be_valid
  end
end

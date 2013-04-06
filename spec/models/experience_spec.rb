require 'spec_helper'

describe Experience do
  it 'has a valid fabricator' do
    expect(Fabricate.build(:experience)).to be_valid
  end
end

require 'spec_helper'

describe ContactInformation do
  it 'has a valid fabrictor' do
    Fabricate.build(:contact_information).should be_valid
  end
end

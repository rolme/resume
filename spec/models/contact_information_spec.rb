require 'spec_helper'

describe ContactInformation do
  it "has a valid factory" do
  	Fabricate.build(:contact_information).should be_valid
  end

  it "fails with invalid contact_type" do
  	Fabricate.build(:contact_information, :contact_type => nil).should_not be_valid
  end
end

require 'spec_helper'

describe ContactType do
  it "has a valid factory" do
  	Fabricate.build(:contact_type).should be_valid
  end
end

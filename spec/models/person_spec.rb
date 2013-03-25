require 'spec_helper'

describe Person do
  it "should have a valid factory" do
  	Fabricate.build(:person).should be_valid
  end
end

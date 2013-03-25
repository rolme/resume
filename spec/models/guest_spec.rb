require 'spec_helper'

describe Guest do
  it "should have a valid factory" do
  	Fabricate.build(:guest).should be_valid
  end

  describe "with a valid guest record" do
    before(:each) do
      @guest = Fabricate.build(:guest)
    end

    it "should return a guest handle" do
    	@guest.handle.should eq("guest")
    end

    it "when asked guest? should return true" do
    	@guest.guest?.should be(true)
    end
  end
end

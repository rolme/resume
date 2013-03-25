require 'spec_helper'

describe User do
  it "should have a valid factory" do
  	Fabricate.build(:user).should be_valid
  end

  describe "with a valid user" do
    before(:each) do
      @authentication = Fabricate.build(:authentication, handle: "test_user")
    	@user = Fabricate.build(:user, authentication: @authentication)
    end

    it "should return a user handle" do
    	@user.handle.should eq("test_user")
    end

    it "should raise an error when requesting encrypted password" do
      expect { @user.encrypted_password }.to raise_error(NoMethodError)
    end
  end
end

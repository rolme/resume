require 'spec_helper'

describe User do
  it "should have a valid factory" do
    Fabricate.build(:user).should be_valid
  end

  it "should have a valid test user factory" do
    Fabricate.build(:test_user).should be_valid
  end

  it "should fail on blank email address" do
    Fabricate.build(:user, email: "").should_not be_valid
  end

  it "should fail on duplicate emails" do
    email = "valid@email.com"
    Fabricate(:user, email: email)
    Fabricate.build(:user, email: email).should_not be_valid
  end

  it "should fail if handle is not alphanumeric" do
    Fabricate.build(:user, handle: "1dfsd dsf!!2").should_not be_valid
  end

  it "should fail if handle is too short" do
    Fabricate.build(:user, handle: "12").should_not be_valid
  end

  it "should fail if handle is already taken" do
    handle = "takenhandle"
    Fabricate(:user, handle: handle)
    Fabricate.build(:user, handle: handle).should_not be_valid
  end

  it "should fail on duplicate emails" do
    email = "valid@email.com"
    Fabricate(:user, email: email)
    Fabricate.build(:user, email: email).should_not be_valid
  end

  it "should fail on invalid email address" do
    Fabricate.build(:user, email: "not valid@hellow").should_not be_valid
  end

  it "should fail on password too short" do
    p = '12345'
    Fabricate.build(:user, password: p, password_confirmation: p).should_not be_valid
  end

  it "should fail on mismatched password" do
    p1 = '12341234'
    p2 = '123412345'
    Fabricate.build(:user, password: p1, password_confirmation: p2).should_not be_valid
  end
end

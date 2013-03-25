require 'spec_helper'

describe Authentication do
  it "should have a valid factory" do
  	Fabricate.build(:authentication).should be_valid
  end

  it "should fail on blank email address" do
    Fabricate.build(:authentication, email: "").should_not be_valid
  end

  it "should fail on duplicate emails" do
    email = "valid@email.com"
    Fabricate(:authentication, email: email)
    Fabricate.build(:authentication, email: email).should_not be_valid
  end

=begin
  # Will enable once it is re-implemented

  it "should fail if handle is not alphanumeric" do
    Fabricate.build(:authentication, handle: "1dfsd dsf!!2").should_not be_valid
  end

  it "should fail if handle is too short" do
    Fabricate.build(:authentication, handle: "12").should_not be_valid
  end

  it "should fail if handle is already taken" do
    handle = "takenhandle"
    Fabricate(:authentication, handle: handle)
    Fabricate.build(:authentication, handle: handle).should_not be_valid
  end
=end

  it "should fail on duplicate emails" do
    email = "valid@email.com"
    Fabricate(:authentication, email: email)
    Fabricate.build(:authentication, email: email).should_not be_valid
  end

  it "should fail on invalid email address" do
    Fabricate.build(:authentication, email: "not valid@hellow").should_not be_valid
  end

  it "should fail on password too short" do
    p = '1234123'
    Fabricate.build(:authentication, password: p, password_confirmation: p).should_not be_valid
  end

  it "should fail on mismatched password" do
    p1 = '12341234'
    p2 = '123412345'
    Fabricate.build(:authentication, password: p1, password_confirmation: p2).should_not be_valid
  end
end

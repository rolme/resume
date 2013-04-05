require 'spec_helper'

describe User do
  it "has a valid factory" do
    Fabricate.build(:user).should be_valid
  end

  it "has a valid test user factory" do
    Fabricate.build(:test_user).should be_valid
  end

  it "fails on blank email address" do
    Fabricate.build(:user, email: "").should_not be_valid
  end

  it "fails on duplicate emails" do
    email = "valid@email.com"
    Fabricate(:user, email: email)
    Fabricate.build(:user, email: email).should_not be_valid
  end

  it "fails if handle is not alphanumeric" do
    Fabricate.build(:user, handle: "1dfsd dsf!!2").should_not be_valid
  end

  it "fails if handle is too short" do
    Fabricate.build(:user, handle: "12").should_not be_valid
  end

  it "fails if handle is already taken" do
    handle = "takenhandle"
    Fabricate(:user, handle: handle)
    Fabricate.build(:user, handle: handle).should_not be_valid
  end

  it "fails on duplicate emails" do
    email = "valid@email.com"
    Fabricate(:user, email: email)
    Fabricate.build(:user, email: email).should_not be_valid
  end

  it "fails on invalid email address" do
    Fabricate.build(:user, email: "not valid@hellow").should_not be_valid
  end

  it "fails on password too short" do
    p = '12345'
    Fabricate.build(:user, password: p, password_confirmation: p).should_not be_valid
  end

  it "fails on mismatched password" do
    p1 = '12341234'
    p2 = '123412345'
    Fabricate.build(:user, password: p1, password_confirmation: p2).should_not be_valid
  end

  it "delegates :first_name to :contact_information" do
    user = Fabricate(:user)
    Fabricate(:contact_information, user: user, first_name: 'test')
    user.save!
    expect(user.first_name).to eql 'test'
  end

  it "delegates :city to :address" do
    user = Fabricate(:user)
    Fabricate(:address, user: user, street1: 'test')
    user.save!
    expect(user.street1).to eql 'test'
  end
end

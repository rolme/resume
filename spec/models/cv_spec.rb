require 'spec_helper'

describe Cv do
  it "should have a valid factory" do
    Fabricate.build(:cv).should be_valid
  end

  it "should fail without user" do
    Fabricate.build(:cv, user: nil).should_not be_valid
  end

  it "should fail without a title" do
    Fabricate.build(:cv, title: nil).should_not be_valid
  end

  it "should fail without a target" do
    Fabricate.build(:cv, target: nil).should_not be_valid
  end

  it "should fail on duplicate title" do
    title = "test title"
    Fabricate(:cv, title: title)
    Fabricate.build(:cv, title: title).should_not be_valid
  end

  it "should have many sections" do
    cv = Fabricate.build(:cv)
    2.times do
      cv.sections << Fabricate.build(:section)
    end
    cv.save!
    Cv.find(1).sections.length.should be(2)
  end

end

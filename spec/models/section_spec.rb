require 'spec_helper'

describe Section do
  it "should have a valid factory" do
    Fabricate.build(:section).should be_valid
  end

  it "should fail without a header" do
    Fabricate.build(:section, header: nil).should_not be_valid
  end

  it "should be able to have a parent section" do
    main = Fabricate(:section, header: "main")
    Fabricate(:section, header: "sub1", parent: main)
    expect(Section.find_by_header("sub1").parent).to eq(main)
  end

  it "should be able to find its as a sub-section" do
    main = Fabricate(:section, header: "main")
    Fabricate(:section, header: "sub1", parent: main)
    Fabricate(:section, header: "sub2", parent: main)
    main = Section.find(1)
    main.subsections.length.should be(2)
  end

  it "can be associated to a CV" do
    cv = Fabricate.build(:cv)
    section = Fabricate.build(:section)
    section.cvs << cv
    section.save!
    Cv.find(1).sections.length.should be(1)
  end
end

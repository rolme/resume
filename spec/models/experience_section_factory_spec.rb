require 'spec_helper'

describe ExperienceSectionFactory do
  my_config = [ { :TITLE => 'test1' }, { :TITLE => 'test2', :DEPARTMENT => 'department2' }, { :TITLE => 'test3' } ]

  it 'returns a valid experience section' do
    expect(ExperienceSectionFactory.build(config: my_config)[1].department).to eql 'department2'
  end
end
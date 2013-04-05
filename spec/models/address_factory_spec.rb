require "spec_helper"

describe AddressFactory do
  describe '#create_address' do
    it 'gets data from CONFIG[:ADDRESS]' do
      my_config = {:ADDRESS => { :CITY => 'test' } }
      expect(AddressFactory.build(config: my_config).city).to eql 'test'
    end
  end
end
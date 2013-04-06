require "spec_helper"

describe AddressFactory do
  describe '#create_address' do
    it 'gets data from YML file' do
      my_config = { :CITY => 'test' }
      expect(AddressFactory.build(config: my_config).city).to eql 'test'
    end
  end
end
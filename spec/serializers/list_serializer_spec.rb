require 'rails_helper'

RSpec.describe ListSerializer, :type => :serializer do

  describe 'List Representation' do
    let(:list) { @list = create(:list) }
    let(:serializer) { ListSerializer.new(list) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      serialization.to_json
    end

    it 'checks that the JSON response returns expected' do
      response_attributes = list.attributes.slice *%w(
        id
        name
        permissions
      )
      expect(JSON.parse(subject)).to eq(response_attributes)
    end
  end
end

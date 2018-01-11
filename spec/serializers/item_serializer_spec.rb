require 'rails_helper'

RSpec.describe ItemSerializer, :type => :serializer do

  describe 'Item Representation' do
    let(:item) { @item = create(:item) }
    let(:serializer) { ItemSerializer.new(item) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      serialization.to_json
    end

    it 'checks that the JSON response returns expected' do
      response_attributes = item.attributes.slice *%w(
        list
        id
        description
        compeleted
      )
      expect(JSON.parse(subject)).to eq(response_attributes)
    end
  end
end

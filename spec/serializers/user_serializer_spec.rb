require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do

  describe 'User Representation' do
    let(:user) { @user = create(:user) }
    let(:serializer) { UserSerializer.new(user) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      serialization.to_json
    end

    it 'checks that the JSON response returns expected' do
      response_attributes = user.attributes.slice *%w(
        id
        username
      )
      expect(JSON.parse(subject)).to eq(response_attributes)
    end
  end
end

class ListSerializer < ActiveModel::Serializer
  attributes :user_id, :id, :name, :permissions
end

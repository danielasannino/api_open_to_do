class ItemSerializer < ActiveModel::Serializer
  attributes :list_id, :id, :description, :completed
end

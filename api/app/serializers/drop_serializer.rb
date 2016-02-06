class DropSerializer < ActiveModel::Serializer
  attributes :id, :end_at, :state
  has_one :product
end

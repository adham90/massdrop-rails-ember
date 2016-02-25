class PollSerializer < ActiveModel::Serializer
  attributes :id, :state
  has_one :product
end

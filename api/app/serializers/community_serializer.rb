class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :icon, :cover_image
end

class Picture < ActiveRecord::Base
  attachment :image
  belongs_to :imageable, polymorphic: true
  accepts_nested_attributes_for :imageable
end

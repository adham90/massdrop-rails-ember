class Picture < ActiveRecord::Base
  attachment :image
  belongs_to :imageable, polymorphic: true
end

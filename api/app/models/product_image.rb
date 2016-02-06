class ProductImage < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :product, :image_id
  attachment :image
end

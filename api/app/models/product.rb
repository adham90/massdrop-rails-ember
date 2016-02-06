class Product < ActiveRecord::Base
  validates_presence_of :name, :msrp
  has_many :product_images
  has_many :drops
  has_many :polls
end

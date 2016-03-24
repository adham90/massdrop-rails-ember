class Product < ActiveRecord::Base
  has_many :pictures, as: :imageable
  has_many :drops
  has_many :polls

  validates_presence_of :name, :msrp
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_attachments_for :pictures, attachment: :image, append: true
end

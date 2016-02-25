class Product < ActiveRecord::Base
  validates_presence_of :name, :msrp
  has_many :pictures, as: :imageable
  has_many :drops
  has_many :polls
end

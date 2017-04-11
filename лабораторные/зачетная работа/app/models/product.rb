class Product < ApplicationRecord
  validates :name, :presence => true
  validates :about, :presence => true
  validates :img, :presence => true
  validates :price, :presence => true
end

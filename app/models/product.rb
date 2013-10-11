class Product < ActiveRecord::Base
  has_many :categories

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: false
end

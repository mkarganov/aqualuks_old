class Product < ActiveRecord::Base
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images, dependent: :destroy

  accepts_nested_attributes_for :product_images

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

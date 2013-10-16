class Product < ActiveRecord::Base
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images, dependent: :destroy

  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates_associated :product_images
end

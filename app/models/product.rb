class Product < ActiveRecord::Base
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images, dependent: :destroy
  has_many :order_products
  has_many :orders, through: :order_products


  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates_associated :product_images

  def self.search(search)
    if search
      where('name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end

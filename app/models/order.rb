class Order < ActiveRecord::Base

  has_many :order_products
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  validates :customer_name, :address, :phone, presence: true
end

class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products, dependent: :destroy

  accepts_nested_attributes_for :order_products

  validates :customer_name, :address, :phone, presence: true
end

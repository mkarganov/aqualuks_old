class OrderProduct < ActiveRecord::Base

  belongs_to :product
  belongs_to :order

  delegate :name, :description, :price, :product_images, to: :product
end

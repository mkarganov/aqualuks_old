class Order < ActiveRecord::Base

  STATUSES = ['pending', 'delivered', 'canceled']

  before_create :set_status, :calculate_total

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products, dependent: :destroy

  accepts_nested_attributes_for :order_products, allow_destroy: true

  validates :customer_name, :address, :phone, presence: true

  def added_product_ids=(new_ids)
    self.product_ids = self.product_ids + new_ids
    self.total = self.order_products.map{ |op| op.price * (op.quantity||1)}.inject(:+)
  end

  protected

  def set_status
    self.status = 'pending'
  end

  def calculate_total
    self.total = self.order_products.map{ |op| op.price * op.quantity}.inject(:+)
  end
end

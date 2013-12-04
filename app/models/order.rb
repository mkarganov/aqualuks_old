class Order < ActiveRecord::Base

  before_save :set_status_and_calculate_total

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products, dependent: :destroy

  accepts_nested_attributes_for :order_products

  validates :customer_name, :address, :phone, presence: true

  def set_status_and_calcualte_total
    self.status = 'pending'
    self.total = self.order_products.map(&:price).inject(:+)
  end
end

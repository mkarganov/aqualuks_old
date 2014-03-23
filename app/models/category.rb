class Category < ActiveRecord::Base
  has_many :sub_categories, class_name: 'Category', foreign_key: :parent_id, dependent: :nullify
  belongs_to :parent, class_name: 'Category'
  has_many :product_categories, dependent: :restrict_with_exception
  has_many :products, through: :product_categories

  scope :main, -> { where(parent_id: nil) }
  scope :without_current, ->(id) { where.not(id: id) }
end

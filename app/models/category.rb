class Category < ActiveRecord::Base
  has_many :sub_categories, class_name: 'Category', foreign_key: :parent_id, dependent: :nullify
  has_many :product_categories
  has_many :products, through: :product_categories
end

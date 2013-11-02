class AddFeaturedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :featured, :boolean
    add_column :products, :popular, :boolean
  end
end

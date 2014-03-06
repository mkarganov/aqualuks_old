class AddStatusAndTotalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :integer
    add_column :orders, :total, :float
  end
end

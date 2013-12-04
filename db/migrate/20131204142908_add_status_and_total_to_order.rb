class AddStatusAndTotalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :total, :float
  end
end

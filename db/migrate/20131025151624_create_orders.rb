class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.text :address
      t.string :phone
      t.text :comment

      t.timestamps
    end
  end
end

class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :phone, :string
  end
end

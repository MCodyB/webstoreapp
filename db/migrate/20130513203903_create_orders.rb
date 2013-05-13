class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.timestamps
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity
    end

    add_index(:orders, [:user_id, :product_id], unique: true)
  end
end

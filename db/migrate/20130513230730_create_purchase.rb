class CreatePurchase < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.timestamps
      t.integer :order_id
      t.integer :product_id
    end
  end
end

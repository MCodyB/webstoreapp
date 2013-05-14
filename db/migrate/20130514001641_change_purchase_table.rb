class ChangePurchaseTable < ActiveRecord::Migration
  def change
    rename_column :purchases, :product_id, :purchase_price
  end
end
